library(vegan)


### Name: raupcrick
### Title: Raup-Crick Dissimilarity with Unequal Sampling Densities of
###   Species
### Aliases: raupcrick
### Keywords: multivariate

### ** Examples

## data set with variable species richness
data(sipoo)
## default raupcrick
dr1 <- raupcrick(sipoo)
## use null model "r0" of oecosimu
dr0 <- raupcrick(sipoo, null = "r0")
## vegdist(..., method = "raup") corresponds to 'null = "r0"'
d <- vegdist(sipoo, "raup")
op <- par(mfrow=c(2,1), mar=c(4,4,1,1)+.1)
plot(dr1 ~ d, xlab = "Raup-Crick with Null R1", ylab="vegdist")
plot(dr0 ~ d, xlab = "Raup-Crick with Null R0", ylab="vegdist")
par(op)

## The calculation is essentially as in the following oecosimu() call,
## except that designdist() is replaced with faster code
## Not run: ##D 
##D oecosimu(sipoo, function(x) designdist(x, "J", "binary"), method = "r1")
## End(Not run)



