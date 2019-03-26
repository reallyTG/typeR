library(sampling)


### Name: inclusionprobastrata
### Title: Inclusion probabilities for a stratified design
### Aliases: inclusionprobastrata
### Keywords: survey

### ** Examples

# the strata
strata=c(1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3)
# sample size in each stratum
nh=c(2,3,3)
inclusionprobastrata(strata,nh)



