{% extends '_layout.swig' %}

{% import '_macro/tabnav.swig' as tabnav %}

{% block title %}{{ config.title }}{% endblock %}

{% block tabnav %}
{{ tabnav.render("index") }}
{% endblock %}


{% block content %}
{% set postNumber = 5 %}
{% set postCount = 0 %}
<div class="index-content">
    <span></span>
    <ul class="post-lists">
        {% for post in page.posts %}
        {% if postCount < postNumber %}
        <li>
            <div class="lists-item">
                <span class="post-date">{{ moment(post.date, "YYYYMMDD", 'zh-cn').fromNow() }}</span>
                <div class="title"><a href="{{ url_for(post.path) }}">{{ post.title }}</a></div>
                <div class="item-footer">
                    <span>分类于: </span>
                    {% for cat in post.categories %}
                    <span><a href="/categories/{{cat.name}}/#_tabnav">{{cat.name}} |</a></span>
                    {% endfor %}
                    <span class="ds-thread-count" data-thread-key="{{ post.path }}"></span>
                </div>
            </div>
        </li>
        {% set postCount = postCount + 1 %}
        {% endif %}
        {% endfor %}
    </ul>
    <div class="more-article">
        <a href="/archives#_tabnav"><span>更多 </span><i class="iconfont icon-right"></i></a>
    </div>
    {% if page.prev or page.next %}
    <nav class="pagination">

    </nav>
    {% endif %}
</div>
{% endblock %}

{% block script %}
{% endblock %}