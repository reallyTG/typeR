library(rptR)


### Name: rptBinary
### Title: GLMM-based Repeatability Estimation for Binary Data
### Aliases: rptBinary

### ** Examples

data(BeetlesMale)

# Note: nboot and npermut are set to 0 for speed reasons. 

# repeatability with one grouping level
rptBinary(Colour ~ (1|Population), grname=c("Population"), 
data=BeetlesMale, nboot=0, npermut=0)

# unadjusted repeatabilities with  fixed effects and 
# estimation of the fixed effect variance
rptBinary(Colour ~ Treatment + (1|Container) + (1|Population), 
                   grname=c("Container", "Population", "Fixed"), 
                   data=BeetlesMale, nboot=0, npermut=0, adjusted=FALSE)


## Not run: 
##D # variance estimation of random effects and residual
##D R_est <- rptBinary(Colour ~ Treatment + (1|Container) + (1|Population), 
##D                    grname=c("Container","Population","Residual"), 
##D                    data = BeetlesMale, nboot=0, npermut=0, ratio = FALSE)
## End(Not run)    

     



