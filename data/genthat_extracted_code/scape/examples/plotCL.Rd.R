library(scape)


### Name: plotCL
### Title: Plot Catch at Length
### Aliases: plotCL

### ** Examples

plotCL(x.ling, fit=FALSE, strip=FALSE, series="1", sex="Female",
       xlab="Length (cm)", ylab="Year")

plotCL(x.oreo, xlab="Length (cm)", ylab="Proportion in catch")

plotCL(x.oreo, "s", layout=c(2,1), xlab="Length (cm)",
       ylab="Observed proportion in survey", cex.points=0.8,
       col.points=c("red","blue"), lty.lines=0)

plotCL(x.ling, fit=FALSE, series="2", xlab="Length (cm)",
       ylab="Observed proportion in trawl catch", tck=0.5)

plotCL(x.ling, series="2", swap=TRUE, lengths=70:150, lty.grid=0)



