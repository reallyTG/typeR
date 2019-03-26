## ----setup,include=FALSE-------------------------------------------------
library(knitr)
library(ggplot2)

knitr::opts_chunk$set(fig.height=4, fig.width=6,
                      cache=TRUE, autodep = TRUE, cache.path = 'facet-rep-labels/')

## ----facet_grid_example,fig.cap='Faceting works quite well in its default form. When the panel\'s borders are drawn, nothing lacks.'----
p <- ggplot(mpg, aes(displ, cty)) + geom_point()
p + facet_grid(drv ~ cyl) + theme_bw()

## ----facet_grid_lemon,fig.cap='The optimised axis lines are gone from inner panels.'----
library(lemon)
p <- p + coord_capped_cart(bottom='both', left='both') +
  theme_bw() + theme(panel.border=element_blank(), axis.line=element_line())
p + facet_grid(drv ~ cyl)

## ----facet_rep_grid,fig.cap='Axis lines are repeated across all panels by using `facet_rep_grid` of the `lemon` package.'----
library(lemon)
p + facet_rep_grid(drv ~ cyl) + coord_capped_cart(bottom='both', left='both') +
  theme_bw() + theme(panel.border=element_blank(), axis.line=element_line())

## ----facet_wrap,fig.cap="`facet_wrap` keeps y-axis label ticks with `scales='free_y'`."----
p + facet_wrap(~ interaction(cyl, drv), scales='free_y') 

## ----facet_wrap_free,fig.cap='X-axis is entirely fixed, and the plot is littered with x-axis tick labels.'----
p + facet_wrap(~ interaction(cyl, drv), scales='free') + 
  coord_capped_cart(bottom='both', left='both', xlim=c(2,7))

## ----facet_rep_wrap_left,fig.cap='With `repeat.tick.labels` we are free to specify which sides to keep.'----
p + facet_rep_wrap(~ interaction(cyl, drv), scales='free_y', repeat.tick.labels = 'left')

## ----eval=FALSE----------------------------------------------------------
#  p + facet_rep_wrap(~ interaction(cyl, drv), scales='free_y', repeat.tick.labels = 'all')
#  p + facet_rep_wrap(~ interaction(cyl, drv), scales='free_y', repeat.tick.labels = 'bottom')
#  p + facet_rep_wrap(~ interaction(cyl, drv), scales='free_y', repeat.tick.labels = 'left')
#  p + scale_x_continuous(sec.axis = dup_axis()) +
#    facet_rep_wrap(~ interaction(cyl, drv), scales='free_y', repeat.tick.labels = 'all')
#  p + scale_x_continuous(sec.axis = dup_axis()) +
#    facet_rep_wrap(~ interaction(cyl, drv), scales='free_y', repeat.tick.labels = c('top','left'))

