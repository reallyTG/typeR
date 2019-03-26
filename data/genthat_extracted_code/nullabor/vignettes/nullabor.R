## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(out.extra='style="display:block; margin: auto"', fig.align="center")

## ----message=FALSE-------------------------------------------------------
library(nullabor)
library(ggplot2)
library(dplyr)

## ------------------------------------------------------------------------
d <- lineup(null_permute("mpg"), mtcars)
head(d)
# Position of actual data plot
attr(d, "pos")

## ---- fig.height = 10, fig.width = 11------------------------------------
ggplot(data=d, aes(x=mpg, y=wt)) + geom_point() + facet_wrap(~ .sample)

## ---- fig.height = 10, fig.width = 11------------------------------------
d <- rorschach(null_permute("mpg"), mtcars, n = 20, p = 0)
ggplot(data=d, aes(x=mpg, y=wt)) + geom_point() + facet_wrap(~ .sample)

## ------------------------------------------------------------------------
head(null_dist("mpg", dist = "normal")(mtcars))

## ------------------------------------------------------------------------
head(null_permute("mpg")(mtcars))

## ------------------------------------------------------------------------
head(null_lm(wt~mpg, method = 'rotate')(mtcars))

## ------------------------------------------------------------------------
library(MASS)

data(wasps)

wasp.lda <- lda(Group~., data=wasps[,-1])
wasp.ld <- predict(wasp.lda, dimen=2)$x
true <- data.frame(wasp.ld, Group=wasps$Group)

wasp.sim <- data.frame(LD1=NULL, LD2=NULL, Group=NULL, .n=NULL)
for (i in 1:19) {
  x <- wasps
  x$Group <- sample(x$Group)
  x.lda <- lda(Group~., data=x[,-1])
  x.ld <- predict(x.lda, dimen=2)$x
  sim <- data.frame(x.ld, Group=x$Group, .n=i)
  wasp.sim <- rbind(wasp.sim, sim)
}

pos <- sample(1:20, 1)
d <- lineup(true=true, samples=wasp.sim, pos=pos)
ggplot(d, aes(x=LD1, y=LD2, colour=Group)) + 
  facet_wrap(~.sample, ncol=5) +
  geom_point() + theme(aspect.ratio=1)

attr(d, "pos")

## ------------------------------------------------------------------------
pvisual(4, 10)

## ------------------------------------------------------------------------
data(turk_results)
visual_power(turk_results)

