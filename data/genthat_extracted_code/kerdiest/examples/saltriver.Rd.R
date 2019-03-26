library(kerdiest)


### Name: saltriver
### Title: Data from the Salt River near Roosevelt, AZ, USA, for 1924-2006.
### Aliases: saltriver
### Keywords: datasets

### ** Examples

data(saltriver)
peak<-saltriver$peakflow
year<-saltriver$year
plot(year,peak, type="l",ylab="Annual peak flow")



