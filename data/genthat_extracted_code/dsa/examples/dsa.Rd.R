library(dsa)


### Name: dsa
### Title: Seasonally Adjust Daily Time Series
### Aliases: dsa

### ** Examples

x = daily_sim(n=4)$original # series with length 4 years
res <- dsa(x, cval=7, model=c(3,1,0),fourier_number = 13, reg.create=NULL) 



