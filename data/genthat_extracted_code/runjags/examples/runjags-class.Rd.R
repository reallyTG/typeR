library(runjags)


### Name: runjags-class
### Title: The runjags class and available S3 methods
### Aliases: as.jags as.jags.runjags as.mcmc.list.runjags as.mcmc.runjags
###   as.runjags as.runjags.jags cleanup.JAGS cleanup.jags failed.JAGS
###   failed.jags failedjags fitted.runjags is.runjags predict.runjags
###   residuals.runjags runjags-class runjagsclass runjagsstudy-class
###   runjagsstudyclass
### Keywords: models

### ** Examples

if(require('rjags')){
# Coercion between jags and runjags objects (requires loading the rjags package):
data(LINE)
jags.model <- LINE
runjags.model <- as.runjags(jags.model, monitor=c('alpha','beta'))
runjags.model <- extend.jags(runjags.model, method='interruptible')
jags.model <- as.jags(runjags.model)
# Coercion to MCMC (requires loading the coda package):
library('coda')
mcmc <- as.mcmc.list(runjags.model)
summary(mcmc)
}



