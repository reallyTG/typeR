library(artfima)


### Name: plot.artfima
### Title: Plot Method for "arfima" Object
### Aliases: plot.artfima
### Keywords: ts

### ** Examples

z <- artsim(n=500, d=5/6, lambda=0.045)
ans <- artfima(z)
plot(ans)
plot(ans, which="loglogsdf", subQ=FALSE, mainQ=FALSE)
title(main="Simulated Series", sub="delta=5/6")



