library(bigleaf)


### Name: wind.profile
### Title: Wind Speed at Given Heights in the Surface Layer
### Aliases: wind.profile

### ** Examples

df <- data.frame(Tair=25,pressure=100,wind=c(3,4,5),ustar=c(0.5,0.6,0.65),H=c(200,230,250)) 
wind.profile(df,heights=seq(18,40,2),zr=40,zh=25,d=16)




