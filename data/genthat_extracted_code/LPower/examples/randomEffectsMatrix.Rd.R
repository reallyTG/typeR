library(LPower)


### Name: randomEffectsMatrix
### Title: Calculates the variance covariance matrix for a multivariate
###   normal vector when there are random effects.
### Aliases: randomEffectsMatrix
### Keywords: design

### ** Examples

 #Creates random variance covariance matrix for random follow up model
 #where baseline is random among patients and all follow up have a compound symetry structure
 #from a common random effect
vars=randomEffectsMatrix(cbind(rep(1,5),matrix(c(0,rep(1,4)),5,1)),
            matrix(c(31.8,.8527,.8527,.6687),2,2),2.7085)
LPower(sample_size=40,power=.8,
          xMatrix=list(cbind(1,c(0,rep(1,4)),0),cbind(1,c(0,rep(1,4)),c(0,rep(1,4)))),vMatrix=vars)
#Creates random variance covariance matrix for random slopes model
vars=randomEffectsMatrix(cbind(rep(1,5),0:4),
            matrix(c(31.8,.8527,.8527,.6687),2,2),2.7085)
LPower(sample_size=40,power=.8,
       xMatrix=list(cbind(1,0:4,0),cbind(1,0:4,0:4)),vMatrix=vars)




