library(rptR)


### Name: rptProportion
### Title: GLMM-based Repeatability Estimation for Proportion Data
### Aliases: rptProportion

### ** Examples

data(BeetlesMale)

# prepare proportion data
BeetlesMale$Dark <- BeetlesMale$Colour
BeetlesMale$Reddish <- (BeetlesMale$Colour-1)*-1
BeetlesColour <- aggregate(cbind(Dark, Reddish) ~ Treatment + Population + Container, 
     data=BeetlesMale, FUN=sum)

# Note: nboot and npermut are set to 0 for speed reasons. 

# repeatability with one grouping level
rptProportion(cbind(Dark, Reddish) ~ (1|Population), 
     grname=c("Population"), data=BeetlesColour, nboot=3, npermut=3)

# unadjusted repeatabilities with  fixed effects and 
# estimation of the fixed effect variance
rptProportion(cbind(Dark, Reddish) ~ Treatment + (1|Container) + (1|Population), 
     grname=c("Population", "Fixed"), 
     data=BeetlesColour, nboot=0, npermut=0, adjusted=FALSE)
                   
# variance estimation of random effects, residual and overdispersion 
rptProportion(cbind(Dark, Reddish) ~ Treatment + (1|Container) + (1|Population), 
     grname=c("Container","Population","Residual", "Overdispersion"), 
     data = BeetlesColour, nboot=0, npermut=0, ratio = FALSE)




