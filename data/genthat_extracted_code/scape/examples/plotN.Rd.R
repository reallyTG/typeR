library(scape)


### Name: plotN
### Title: Plot Numbers at Age
### Aliases: plotN

### ** Examples

plotN(x.cod, div=1000, xlab=c("Age (years)","Year"),
      ylab="Individuals (million)")

plotN(x.cod, "l", div=1000, xlab="Age", ylab="Individuals (million)")

plotN(x.cod, "r", age=3, div=1000, xlim=c(1967,2002))

plotN(x.cod, "p", div=1000, ages=3:10, xlim=c(2,11), xlab="Age",
      ylab="Individuals (million)", cex.strip=0.7, cex.axis=0.7,
      tck=0.5)

plotN(x.cod, "b", xlab="Age (years)", ylab="Year", cex.points=0.7)



