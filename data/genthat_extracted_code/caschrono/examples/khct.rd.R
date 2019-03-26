library(caschrono)


### Name: khct
### Title: Monthly electricity comsumption for the period 1970-1984
### Aliases: khct
### Keywords: datasets

### ** Examples

data(khct)
# The executed code is : 
## Not run: 
khct = read.csv2(file= system.file("/import/conselec.csv",package="caschrono"))
attach(khct)
khc = ts(cbind(kwh, htdd,cldd), frequency = 12, start=c(1970,1))
kwh = khc[,1]
htdd = khc[,2]
cldd = khc[,3]
temps = time(kwh)
## End(Not run)



