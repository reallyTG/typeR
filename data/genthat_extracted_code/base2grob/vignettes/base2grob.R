## ----style, echo=FALSE, results="asis", message=FALSE--------------------
knitr::opts_chunk$set(tidy = FALSE,
		   message = FALSE)

## ----echo=FALSE, results="hide", message=FALSE---------------------------
library("ggplot2")
library("cowplot")
library("grid")
library("base2grob")

## ----warning=FALSE-------------------------------------------------------
library("grid")
library("base2grob")

p1 <- base2grob(~barplot(1:10))
p2 <- base2grob(expression(plot(rnorm(10))))
p3 <- base2grob(~pie(1:5))
p4 <- base2grob(function() plot(sin))

## ----fig.width=7, fig.height=7-------------------------------------------
grid.newpage()
grid.draw(p1)
vp = viewport(x=.35, y=.75, width=.35, height=.3)
pushViewport(vp)
grid.draw(p2)
upViewport()

## ------------------------------------------------------------------------
library(ggplot2)

f <- tempfile(fileext = ".pdf")
f
ggsave(p1, filename = f)
file.info(f)$size

## we can even directly using formula or expression of base plot command inside ggsave
ggsave(~pie(1:3), filename = f)
file.info(f)$size

## even function is supported
ggsave(function() plot(sqrt), filename = f)
file.info(f)$size

## ----fig.width=10, fig.height=6------------------------------------------
library(cowplot)
p5 <- base2grob(~image(volcano))
p6 <- qplot(rnorm(10), rnorm(10)) + theme_grey()
plot_grid(p1, p2, p3, p4, p5, p6, ncol=3, labels=LETTERS[1:6])

