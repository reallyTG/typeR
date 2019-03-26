library(PP)


### Name: sim_gpcm
### Title: Simulate data for the gpcm model
### Aliases: sim_gpcm

### ** Examples

################# simulate GPCM ###############################################

set.seed(1750)

THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
# slopes
sl     <- c(0.5,1,1.5,1.1,1,0.98)

THRESx <- rbind(0,THRES)

THETA  <- rnorm(100)

simdat_gpcm <- sim_gpcm(thres = THRESx,alpha = sl,theta = THETA)

head(simdat_gpcm)


### simulate with a different number of categories


THRES1 <- rbind(THRESx,c(NA,NA,NA,NA,1.7,1))
THRES1 # last 2 items have +1 category

simdat_gpcm2 <- sim_gpcm(thres = THRES1,alpha = sl,theta = THETA)

head(simdat_gpcm2)

# check the maximum category
apply(simdat_gpcm2,2,max)





