library(depmixS4)


### Name: forwardbackward
### Title: Forward and backward variables
### Aliases: forwardbackward forwardbackward,mix-method
###   forwardbackward,depmix-method
### Keywords: methods

### ** Examples


data(speed)

# 2-state model on rt and corr from speed data set 
# with Pacc as covariate on the transition matrix
# ntimes is used to specify the lengths of 3 separate series
mod1 <- depmix(list(rt~1,corr~1),data=speed,transition=~Pacc,nstates=2,
	family=list(gaussian(),multinomial("identity")),ntimes=c(168,134,137))

fb <- forwardbackward(mod1)
all.equal(-sum(log(fb$sca)),fb$logLike)




