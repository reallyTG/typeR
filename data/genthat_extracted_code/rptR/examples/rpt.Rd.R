library(rptR)


### Name: rpt
### Title: Repeatability Estimation for Gaussian and Non-Gaussian Data
### Aliases: rpt
### Keywords: models

### ** Examples

# load data
data(BeetlesBody)
data(BeetlesMale)
data(BeetlesFemale)

#  prepare proportion data
BeetlesMale$Dark <- BeetlesMale$Colour
BeetlesMale$Reddish <- (BeetlesMale$Colour-1)*-1
BeetlesColour <- aggregate(cbind(Dark, Reddish) ~ Treatment + Population + Container, 
     data=BeetlesMale, FUN=sum)

# Note: nboot and npermut are set to 0 for speed reasons. Use larger numbers
# for the real analysis.

# gaussian data (example with a single random effect)
rpt(BodyL ~ (1|Population), grname="Population", data=BeetlesBody, 
     nboot=0, npermut=0, datatype = "Gaussian")

# poisson data (example with two grouping levels and adjusted for fixed effect)
rpt(Egg ~ Treatment + (1|Container) + (1|Population), grname=c("Population"), 
     data = BeetlesFemale, nboot=0, npermut=0, datatype = "Poisson")

## Not run: 
##D 
##D # binary data (example with estimation of the fixed effect variance)
##D rpt(Colour ~ Treatment + (1|Container) + (1|Population), 
##D      grname=c("Population", "Container", "Fixed"), 
##D      data=BeetlesMale, nboot=0, npermut=0, datatype = "Binary", adjusted = FALSE)
##D 
##D # proportion data (example for the estimation of raw variances, 
##D # including residual and fixed-effect variance)
##D rpt(cbind(Dark, Reddish) ~ Treatment + (1|Population), 
##D      grname=c("Population", "Residual", "Fixed"), data=BeetlesColour,
##D      nboot=0, npermut=0, datatype = "Proportion", ratio=FALSE)
##D 
## End(Not run)




