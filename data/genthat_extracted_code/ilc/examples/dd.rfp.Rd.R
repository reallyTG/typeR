library(ilc)


### Name: dd.rfp
### Title: Artificial (stratified) mortality experience (with Poisson
###   error) for testing the SLC regression
### Aliases: dd.rfp
### Keywords: method

### ** Examples

# vector of means of the additional effect (other than age and period):
rfp <- c(0.5, 1.2, -0.7, 2.5)
# create artificial stratified mortality experience of rhdata class:
rfp.cmi <- dd.rfp(dd.cmi.pens, rfp)
# print stratified rhdata data summary:
rfp.cmi
# plot the base level experience in the stratified rhdata
# a. central exposures:
matplot(rfp.cmi$age, rfp.cmi$pop[,,1], type='l', xlab='Age', ylab='Ec', main='Base Level')
# b. deaths:
matplot(rfp.cmi$age, rfp.cmi$deaths[,,1], type='l', xlab='Age', ylab='D', main='Base Level')
# c. log mortality rates:
matplot(rfp.cmi$age, log(rfp.cmi$mu[,,1]), type='l', xlab='Age', ylab='log(mu)', main='Base Level')



