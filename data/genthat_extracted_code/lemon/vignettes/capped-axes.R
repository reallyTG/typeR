## ----setup,include=FALSE-------------------------------------------------
library(knitr)

knitr::opts_chunk$set(fig.height=4, fig.width=6,
                      cache=TRUE, autodep = TRUE, cache.path = 'capped-axes-cache/')

## ----load_pkg_and_data,fig.cap='Default ggplot2 plotting.'---------------
library(ggplot2)
library(lemon)

dat1 <- data.frame(
  gp = factor(rep(letters[1:3], each = 10)),
  y = rnorm(30),
  cl = sample.int(3, 30, replace=TRUE),
  cl2 = sample(c('a','b','c'), 30, replace=TRUE)
)

my.theme <- theme_light()

(
  p <- ggplot(dat1, aes(gp, y)) + geom_point() + my.theme
)

## ----theme---------------------------------------------------------------
my.theme <- my.theme + theme(panel.border=element_blank(), 
                             axis.line = element_line(), 
                             axis.ticks = element_line(colour='black'))
p <- p + my.theme

## ----fig.cap='Using `coord_capped_cart` to cap the bottom axis from the right. The left axis is unaffected.'----
p + coord_capped_cart(bottom='right')

## ----fig.cap='As before, but left axis is now also capped to give a consistent look.'----
p + coord_capped_cart(bottom='right', left='none')

## ----fig.cap='Placing brackets instead of ticks emphasises that the x-scale is categorical and not nominal.'----
ggplot(dat1, aes(gp, y)) + geom_point(position=position_jitter(width=0.2, height=0)) +
  coord_capped_cart(left='none', bottom=brackets_horizontal()) +
  my.theme + theme(panel.grid.major.x = element_blank())

## ----brackets------------------------------------------------------------
p <- ggplot(mpg, aes(cyl, hwy, colour=class)) +
  geom_point(position=position_jitter(width=0.3)) +
  scale_x_continuous(breaks=c(4,5,6,8), sec.axis=dup_axis()) + 
  scale_y_continuous(sec.axis=dup_axis()) +
  coord_flex_cart(bottom=brackets_horizontal(), 
                  top=brackets_horizontal(direction='down'),
                  left=brackets_vertical(), 
                  right=brackets_vertical(direction='right')) +
  my.theme
p

## ------------------------------------------------------------------------
p <- ggplot(mpg, aes(cyl, hwy, colour=class)) +
  geom_point(position=position_jitter(width=0.3)) +
  coord_flex_cart(bottom=brackets_horizontal(tick.length=0), 
                  left=brackets_vertical(tick.length = unit(1, 'cm'))) +
  my.theme
p

## ------------------------------------------------------------------------
dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
(d <- ggplot(dsamp, aes(carat, price)) +
  geom_point(aes(colour = clarity)) + 
  coord_capped_cart(bottom='none', left='bottom') +
  facet_grid(.~cut) + my.theme
)

## ------------------------------------------------------------------------
d + facet_rep_grid(.~cut)

## ------------------------------------------------------------------------
d + facet_rep_grid(.~cut, repeat.tick.labels = TRUE)

## ------------------------------------------------------------------------
(d2 <- d + facet_rep_wrap(~cut, ncol=2))

## ------------------------------------------------------------------------
d2 <- d2 + guides(colour=guide_legend(ncol=3)) + 
  theme(legend.background = element_rect(colour='grey'))
reposition_legend(d2, position='center', panel='panel-2-3')

## ----echo=FALSE,fig.cap='Some points which should center around 0, but the scale indicates it\' off-target.'----
df <- data.frame(x=sample(letters[1:2], 30, replace=TRUE),
                 y=sort(rnorm(30, 0.5)))
(p <- ggplot(df, aes(x=x, y=y)) + geom_point(position=position_jitter(width=0.2)))

## ----fig.cap='With the now added symmetric scale, it is nicely centered around 0.'----
p + scale_y_symmetric(mid=0)

