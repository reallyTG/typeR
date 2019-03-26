library(rpsychi)


### Name: ssd2sd
### Title: Convert sample standard deviation into unbiased one
### Aliases: ssd2sd
### Keywords: univar

### ** Examples

data(infert)
ssd2sd(nrow(infert), ssd(infert$age))
sd(infert$age)



