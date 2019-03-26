library(dynfrail)


### Name: dynfrail_prep
### Title: Preparation of the input for 'dynfrail_fit'
### Aliases: dynfrail_prep

### ** Examples

arglist1 <- dynfrail_prep(Surv(time, status) ~ rx + sex + cluster(litter),
data = rats)




