library(unmarked)


### Name: jay
### Title: European Jay data from the Swiss Breeding Bird Survey 2002
### Aliases: jay
### Keywords: datasets

### ** Examples

data(jay)
str(jay)

# Carry out a simple analysis, without covariates:
# Create a customised piFun (see ?piFun for details)
crPiFun <- function(p) {
   p1 <- p[,1] # Extract the columns of the p matrix, one for 
   p2 <- p[,2] #   each of J = 3 sample occasions
   p3 <- p[,3]
   cbind(      # define multinomial cell probabilities:
      "100" = p1 * (1-p2) * (1-p3),
      "010" = (1-p1) * p2 * (1-p3),
      "001" = (1-p1) * (1-p2) * p3,
      "110" = p1 * p2 * (1-p3),
      "101" = p1 * (1-p2) * p3,
      "011" = (1-p1) * p2 * p3,
      "111" = p1 * p2 * p3,
      "10x" = p1*(1-p2),
      "01x" = (1-p1)*p2,
      "11x" = p1*p2)
}
# Build the unmarkedFrame object
mhb.umf <- unmarkedFrameMPois(y=as.matrix(jay$caphist),
  obsToY=matrix(1, 3, 10), piFun="crPiFun")
# Fit a model
( fm1 <- multinomPois(~1 ~1, mhb.umf) )



