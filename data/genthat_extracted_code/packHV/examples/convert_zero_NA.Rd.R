library(packHV)


### Name: convert_zero_NA
### Title: Convert 0s in NA
### Aliases: convert_zero_NA

### ** Examples

my.data=data.frame(x=rbinom(20,1,0.5),y=rbinom(20,1,0.5),z=rbinom(20,1,0.5))
my.data=convert_zero_NA(my.data,c("y","z"))



