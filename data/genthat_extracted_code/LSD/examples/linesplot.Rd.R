library(LSD)


### Name: linesplot
### Title: One-dimensional scatterplot
### Aliases: LSD.linesplot linesplot
### Keywords: boxplotlike

### ** Examples

l = list()
for (i in 1:10){l[[i]] = rnorm(100,sqrt(i^2.5),1+i/2)}

linesplot(l,alpha=25,border="darkred",addboxes = TRUE,outline=FALSE)



