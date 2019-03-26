library(ecospace)


### Name: ecospace-package
### Title: ecospace: Simulating Community Assembly and Ecological
###   Diversification Using Ecospace Frameworks
### Aliases: ecospace-package ecospace

### ** Examples

# Get package version, citation, updates, and vignette
packageVersion("ecospace")
citation("ecospace")
news(package="ecospace")
vignette("ecospace")

# Create an ecospace framework (functional-trait space) with 15 characters
#    (functional traits) of mixed types
nchar <- 15
ecospace <- create_ecospace(nchar=nchar, char.state=rep(3, nchar),
  char.type=rep(c("factor", "ord.fac", "ord.num"), nchar / 3))

# Use to assemble a stochastic "neutral" sample of 20 species (from
#    initial seeding by 5 species)
x <- neutral(Sseed=5, Smax=20, ecospace=ecospace)
head(x, 10)

# Calculate ecological disparity (functional diversity) dynamics as a
#    function of species richness
# Statistic 'V' [total variance] not calculated because there are factors
#    in the sample
metrics <- calc_metrics(samples=x, Smax=20, Model="Neutral", Param="NA")
metrics

# Plot statistical dynamics as function of species richness
op <- par()
par(mfrow=c(2,4), mar=c(4, 4, 1, .3))
attach(metrics)
plot(S, H, type="l", cex=.5)
plot(S, D, type="l", cex=.5)
plot(S, M, type="l", cex=.5)
plot(S, V, type="l", cex=.5)
plot(S, FRic, type="l", cex=.5)
plot(S, FEve, type="l", cex=.5)
plot(S, FDiv, type="l", cex=.5)
plot(S, FDis, type="l", cex=.5)

par(op)




