library(gamlss.data)


### Name: aep
### Title: The Hospital Stay Data
### Aliases: aep
### Keywords: datasets

### ** Examples

data(aep)
attach(aep)
pro<-noinap/los
plot(ward,pro)
rm(pro)
detach(aep)



