library(VFP)


### Name: predictMean
### Title: Finding X-Value for Given Y-Value Using a Bisection-Approach.
### Aliases: predictMean

### ** Examples

## No test: 

# perform variance component analyses first
library(VCA)
data(CA19_9)
fits.CA19_9 <- anovaVCA(result~site/day, CA19_9, by="sample")

# extract repeatability
mat.CA19_9 <- getMat.VCA(fits.CA19_9, "error")
res.CA19_9 <- fit.vfp(mat.CA19_9, 1:10)
summary(res.CA19_9)
print(res.CA19_9)

# predict CA19_9-concentration with 5% CV
predictMean(res.CA19_9, newdata=5) 

# this is used in function plot.VFP as well
plot(res.CA19_9, Prediction=list(y=5), type="cv")
plot(res.CA19_9, Prediction=list(y=5), type="cv", 
		xlim=c(0, 80), ylim=c(0, 10))
## End(No test)



