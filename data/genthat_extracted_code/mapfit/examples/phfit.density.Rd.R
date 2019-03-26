library(mapfit)


### Name: phfit.density
### Title: PH fitting with density function
### Aliases: phfit.density

### ** Examples

####################
##### truncated density
####################

## PH fitting for general PH
(result1 <- phfit.density(ph=ph(2), f=dnorm,
                          mean=3, sd=1))

## PH fitting for CF1
(result2 <- phfit.density(ph=cf1(2), f=dnorm,
                          mean=3, sd=1))

## PH fitting for hyper Erlang
(result3 <- phfit.density(ph=herlang(3), f=dnorm,
                          mean=3, sd=1))

## mean
ph.mean(result1$model)
ph.mean(result2$model)
ph.mean(result3$model)

## variance
ph.var(result1$model)
ph.var(result2$model)
ph.var(result3$model)

## up to 5 moments 
ph.moment(5, result1$model)
ph.moment(5, result2$model)
ph.moment(5, result3$model)




