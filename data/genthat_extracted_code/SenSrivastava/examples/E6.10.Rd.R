library(SenSrivastava)


### Name: E6.10
### Title: Data on Perceived and Computed Travel Times by Bus
### Aliases: E6.10
### Keywords: datasets

### ** Examples

data(E6.10)
## Manipulations of the data for example 8.1, page 161:
t <- c(0,1,rep(0,20),1,rep(0,5),1,rep(0,3))
e6.10 <- data.frame(E6.10, t=t)
rm(t)
summary(e6.10)



