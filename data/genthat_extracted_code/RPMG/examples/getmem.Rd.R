library(RPMG)


### Name: getmem
### Title: Get Member
### Aliases: getmem
### Keywords: misc

### ** Examples


z = list()
for(i in 1:10)
{

z[[i]] = round(10*runif(10))


}

y = as.vector(unlist(lapply(z, getmem, 6)))






