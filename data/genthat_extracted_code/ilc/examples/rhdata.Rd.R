library(ilc)


### Name: rhdata
### Title: Data formatting utility for the extended (Stratified) LC model
###   function
### Aliases: rhdata
### Keywords: method

### ** Examples

# See data set 'tab' provided in the ilc package
# names(tab)
# [1] "refno" "dob"   "dev"   "event" "cov1"  "cov2"
# Get multidimensional survival data: 
mdat <- rhdata(tab, covar='cov2', xbreaks=60:96, xlabels=60:95,
  ybreaks=mdy.date(1,1,2000:2006), ylabels=2000:2005, name='M', label='CMI')
# Warning: although rhdata() can sort by more than a single parameter, for ex.
#   covar=c('cov1', 'cov2'), the SLC fitting only works at the moment with
#   a single extra covariate.

# print data summary:
mdat
#Multidimensional Mortality data for: MDat [M] 
#Across covariates:
#         years: 2000 - 2005
#         ages:  60 - 95
#         cov2: 0, 1, 2, 3
# Graphical illustrations of mdat data levels (by the additional factor):
# plot of exposures:
matplot(mdat$age, mdat$pop[,,1], type='l', xlab='Age', ylab='Ec', main='Base Level')
matplot(mdat$age, mdat$pop[,,2], type='l', xlab='Age', ylab='Ec', main='Level 1')
# plot of deaths:
matplot(mdat$age, mdat$deaths[,,1], type='l', xlab='Age', ylab='D', main='Base Level')
matplot(mdat$age, mdat$deaths[,,2], type='l', xlab='Age', ylab='D', main='Level 1')
# plot of log mortality rates:
matplot(mdat$age, log(mdat$mu[,,1]), type='l', xlab='Age', ylab='log(mu)', main='Base Level')
matplot(mdat$age, log(mdat$mu[,,2]), type='l', xlab='Age', ylab='log(mu)', main='Level 1')



