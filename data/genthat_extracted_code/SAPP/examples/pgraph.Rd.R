library(SAPP)


### Name: pgraph
### Title: Graphical Outputs for the Point Process Data Set
### Aliases: pgraph
### Keywords: spatial

### ** Examples

## The aftershock data of 26th July 2003 earthquake of M6.2
data(main2003JUL26)
x <- main2003JUL26
pgraph(data=x$time, mag=x$magnitude, h=6, npoint=100, days=10)

## The residual point process data of 26th July 2003 earthquake of M6.2
data(res2003JUL26)
y <- res2003JUL26
pgraph(data=y$trans.time, mag=y$magnitude, h=6, npoint=100, days=10)



