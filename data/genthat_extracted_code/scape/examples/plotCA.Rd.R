library(scape)


### Name: plotCA
### Title: Plot Catch at Age
### Aliases: plotCA

### ** Examples

plotCA(x.sbw, fit=FALSE, strip=FALSE, xlab="Age", ylab="Year",
       tick.number=10)

plotCA(x.cod, xlab="Age", ylab="Proportion in catch", cex.strip=0.7,
       cex.axis=0.7, col.lines="brown", layout=c(8,4))

plotCA(x.cod, xlab="Age", ylab="Proportion in catch", cex.strip=0.7,
       cex.axis=0.7, col.lines="brown", layout=c(2,4), swap=TRUE,
       ages=3:10, same.limits=FALSE)

plotCA(x.ling, "s", col.points=c("red","blue"), lty.lines=0, xlab="Age",
       ylab="Observed proportion in survey", tck=0.5, cex.strip=0.7,
       cex.axis=0.7)

plotCA(x.ling, "s", xlab="Age", ylab="Observed proportion in survey",
       fit=FALSE, cex.strip=0.7, cex.axis=0.7, tck=0.5, layout=c(5,2))

plotCA(x.ling, "s", xlab="Age", ylab="Observed proportion in survey",
       fit=FALSE, cex.strip=0.7, cex.axis=0.7, tck=0.5, layout=c(5,6),
       swap=TRUE)



