## ----setup, include=FALSE------------------
library(ggplot2)
library(tint)
# invalidate cache when the package version changes
knitr::opts_chunk$set(tidy = FALSE, cache.extra = packageVersion('tint'))
options(htmltools.dir.version = FALSE)

## ----fig-nocap-margin-first, fig.margin=TRUE, fig.width=4, fig.height=4, cache=TRUE, echo=FALSE----
library(ggplot2)
ggplot(mtcars, aes(wt, mpg)) + geom_point(size=3, aes(colour=factor(cyl))) + theme(legend.position="none")

## ----fig-margin, fig.margin = TRUE, fig.cap = "MPG vs horsepower, colored by transmission.", fig.width=3.5, fig.height=3.5, cache=TRUE----
library(ggplot2)
mtcars2 <- mtcars
mtcars2$am <- factor(
  mtcars$am, labels = c('automatic', 'manual')
)
ggplot(mtcars2, aes(hp, mpg, color = am)) +
  geom_point() + geom_smooth(method="loess", span=0.8) +
  theme(legend.position = 'bottom')

## ----fig-fullwidth, fig.width = 10, fig.height = 2, fig.fullwidth = TRUE, fig.cap = "A full width figure.", warning=FALSE, cache=TRUE----
ggplot(diamonds, aes(carat, price)) + geom_point(size=0.5, alpha=0.1) + facet_grid(~ cut)

## ----fig-main, fig.cap = "A figure in the main column.", cache=TRUE----
ggplot(diamonds, aes(cut, price)) + geom_boxplot()

## ----eval=FALSE----------------------------
#  system2('pandoc-citeproc', '--version')

## ------------------------------------------
knitr::kable(
  mtcars[1:6, 1:6], caption = 'A subset of mtcars.'
)

## ----fig-two-together, fig.cap="Two plots in one figure environment.", fig.show='hold', cache=TRUE----
p <- ggplot(mtcars2, aes(hp, mpg, color = am)) +
  geom_point()
p
p + geom_smooth(method="loess", span=0.8)

## ----fig-two-separate, ref.label='fig-two-together', fig.cap=sprintf("Two plots in separate figure environments (the %s plot).", c("first", "second")), cache=TRUE----
p <- ggplot(mtcars2, aes(hp, mpg, color = am)) +
  geom_point()
p
p + geom_smooth(method="loess", span=0.8)

## ----fig-margin-together, fig.margin=TRUE, fig.show='hold', fig.cap="Two plots in one figure environment in the margin.", fig.width=3.5, fig.height=2.5, cache=TRUE----
p
p + geom_smooth(method = 'loess', span=0.8)

## ----fig-margin-separate, fig.margin=TRUE, fig.cap=sprintf("Two plots in separate figure environments in the margin (the %s plot).", c("first", "second")), fig.width=3.5, fig.height=2.5, cache=TRUE----
knitr::kable(head(iris, 15))
p
knitr::kable(head(iris, 12))
p + geom_smooth(method = 'lm')
knitr::kable(head(iris, 5))

## ----fig-nocap-margin, fig.margin=TRUE, fig.width=3.5, fig.height=2, cache=TRUE----
# a boxplot of weight vs transmission; this figure
# will be placed in the margin
ggplot(mtcars2, aes(am, wt)) + geom_boxplot() +
  coord_flip()

## ----fig-nocap-main, cache=TRUE------------
# a figure in the main column
p <- ggplot(mtcars, aes(wt, hp)) + geom_point()
p

## ----fig-nocap-fullwidth, fig.fullwidth=TRUE, fig.width=10, fig.height=3, cache=TRUE----
# a fullwidth figure
p + geom_smooth(method = 'loess', span=0.8) + facet_grid(~ gear)

## ----eval=FALSE----------------------------
#  file.edit(
#    tint:::template_resources(
#      'tint', '..', 'skeleton', 'skeleton.Rmd'
#    )
#  )

## ----bib, include=FALSE--------------------
# create a bib file for the R packages used in this document
knitr::write_bib(c('base', 'rmarkdown'), file = 'skeleton.bib')

