library(easyCODA)


### Name: RDA
### Title: Redundancy analysis
### Aliases: RDA
### Keywords: multivariate

### ** Examples

# Data frame fish has sex, habitat and mass in first columns, 
# then morphometric data in remaining columns
data(fish)
sex     <- fish[,1]
habitat <- fish[,2]
mass    <- fish[,3]
fishm   <- as.matrix(fish[,4:29])
# Convert to compositional data matrix
fishm   <- fishm / apply(fishm, 1, sum)
# Compute logarithm of mass and interaction of sex (F/M) and habitat (L/P) categories
logmass <- log(mass)
sexhab  <- 2*(sex-1)+habitat
sexhab.names <- c("FL","FP","ML","MP")
rownames(fishm) <- sexhab.names[sexhab]
# Create dummy variables for sexhab and create matrix of covariates
sexhab.Z <- DUMMY(sexhab, catnames=sexhab.names)
vars     <- cbind(logmass, sexhab.Z)
# Perform RDA on centred logratios
require(ca)
fish.RDA <- RDA(CLR(fishm), cov=vars)
# Plot results 
# (for more options see Appendix of Compositional Data Analysis in Practice)
PLOT.RDA(fish.RDA, map="contribution", rescale=0.05, indcat=2:5, 
         colrows=rainbow(4, start=0.1, end=0.8)[sexhab], cexs=c(0.8,0.8,1))



