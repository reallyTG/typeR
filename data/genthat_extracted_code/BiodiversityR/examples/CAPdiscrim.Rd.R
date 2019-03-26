library(BiodiversityR)


### Name: CAPdiscrim
### Title: Canonical Analysis of Principal Coordinates based on
###   Discriminant Analysis
### Aliases: CAPdiscrim
### Keywords: multivariate

### ** Examples

library(vegan)
library(MASS)
data(dune)
data(dune.env)
Ordination.model1 <- CAPdiscrim(dune~Management, data=dune.env,
    dist="bray", axes=2, m=0, add=FALSE)
Ordination.model1
plot1 <- ordiplot(Ordination.model1, type="none")
ordisymbol(plot1, dune.env, "Management", legend=TRUE)

# plot change in classification success against m
plot(seq(1:14), rep(-1000, 14), xlim=c(1, 14), ylim=c(0, 100), xlab="m", 
    ylab="classification success (percent)", type="n")
for (mseq in 1:14) {
    CAPdiscrim.result <- CAPdiscrim(dune~Management, data=dune.env, 
        dist="bray", axes=2, m=mseq)
    points(mseq, CAPdiscrim.result$percent)
}

#




