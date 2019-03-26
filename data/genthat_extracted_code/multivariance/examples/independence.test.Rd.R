library(multivariance)


### Name: independence.test
### Title: test for independence
### Aliases: independence.test

### ** Examples

independence.test(coins(100)) #dependent sample which is 2-independent
independence.test(coins(100),type = "resample") #dependent sample which is 2-independent

independence.test(coins(100)[,2:3]) # independent sample
independence.test(coins(100)[,2:3],type = "resample") # independent sample

independence.test(coins(10),type = "resample") #dependent sample which is 2-independent
independence.test(coins(10)[,2:3],type = "resample") #dependent sample which is 2-independent




