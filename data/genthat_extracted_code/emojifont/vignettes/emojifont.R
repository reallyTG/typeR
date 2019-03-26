## ----style, echo=FALSE, results="asis", message=FALSE--------------------
knitr::opts_chunk$set(tidy = FALSE,
		   message = FALSE)

## ----echo=FALSE, results="hide", message=FALSE---------------------------
library("ggplot2")
library("emojifont")
library("colorspace")

## ------------------------------------------------------------------------
library(emojifont)

search_emoji('smile')
emoji(search_emoji('smile'))

## ----fig.showtext=TRUE---------------------------------------------------
set.seed(123)
x <- rnorm(10)
set.seed(321)
y <- rnorm(10)
plot(x, y, cex=0)
text(x, y, labels=emoji('cow'), cex=1.5, col='steelblue', family='EmojiOne')

## ----fig.showtext=TRUE---------------------------------------------------
d <- data.frame(x=x, y=y,
     label = sample(c(emoji('cow'), emoji('camel')), 10, replace=TRUE),
     type = sample(LETTERS[1:3], 10, replace=TRUE))

library("ggplot2")
ggplot(d, aes(x, y, color=type, label=label)) +
    geom_text(family="EmojiOne", size=6)

## ----fig.showtext=TRUE---------------------------------------------------
ggplot() + geom_emoji("rose", color='steelblue') + theme_void()
x = seq(0, 2*pi, length=30)
y = sin(x)
ggplot() + geom_emoji('heartbeat', x=x, y=y, size=10)

## ----fig.showtext=TRUE---------------------------------------------------
set.seed(2016-03-09)
fa <- fontawesome(c('fa-github', 'fa-weibo', 'fa-twitter', 'fa-android', 'fa-coffee'))
d <- data.frame(x=rnorm(20),
                y=rnorm(20),
     	        label=sample(fa, 20, replace=T))

ggplot(d, aes(x, y, color=label, label=label)) +
    geom_text(family='fontawesome-webfont', size=6)+
    xlab(NULL)+ylab(NULL) +
    theme(legend.text=element_text(family='fontawesome-webfont'))

## ----fig.showtext=TRUE---------------------------------------------------
ggplot() + geom_fontawesome("fa-github", color='black') + theme_void()

## ----echo=FALSE----------------------------------------------------------
sessionInfo()

