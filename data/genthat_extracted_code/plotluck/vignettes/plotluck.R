## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- fig.show='hold'----------------------------------------------------
library(ggplot2)
data(iris)
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) + geom_point() + geom_smooth()

## ---- fig.show='hold'----------------------------------------------------
library(plotluck)
plotluck(iris, Petal.Width~Petal.Length|Species)

## ---- fig.show='hold'----------------------------------------------------
library(gapminder)
plotluck(gapminder, .~1)

## ---- fig.show='hold', warning=FALSE-------------------------------------
opts <- plotluck.options(verbose=TRUE)
plotluck(gapminder, lifeExp~., weights=pop, opts=opts)

## ---- fig.show='hold', warning=FALSE-------------------------------------
plotluck(gapminder, lifeExp~continent, weights=pop, opts=opts)

## ---- fig.show='hold'----------------------------------------------------
plotluck(gapminder, lifeExp~continent+country, weights=pop, opts=opts)

## ---- fig.show='hold'----------------------------------------------------
plotluck(gapminder, lifeExp~year|continent, weights=pop, opts=opts)

## ---- fig.show='hold'----------------------------------------------------
set.seed(6)
sample.plotluck(gapminder, weights=pop, opts)

