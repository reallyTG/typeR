## ----setup,include=FALSE-------------------------------------------------
library(knitr)

knitr::opts_chunk$set(fig.height=4, fig.width=6,
                      cache=TRUE, autodep = TRUE, cache.path = 'geoms-cache/')

## ----fig.height=8,fig.cap=''---------------------------------------------
library(ggplot2)
library(lemon)
library(gridExtra)

data(sunspot.year)
sunspots <- data.frame(count=as.numeric(sunspot.year), year=seq.int(start(sunspot.year)[1], end(sunspot.year)[1]))
sunspots <- subset(sunspots, year > 1900)

point <-  ggplot(sunspots, aes(x=year, y=count)) + geom_point() + geom_line() + labs(title='geom_point + geom_line')
pointline <- ggplot(sunspots, aes(x=year, y=count)) + geom_pointline(distance=unit(3, 'pt'), threshold=0.2) + labs(title='geom_pointline')
grid.arrange(point, pointline)

