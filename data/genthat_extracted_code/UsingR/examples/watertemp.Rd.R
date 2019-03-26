library(UsingR)


### Name: watertemp
### Title: Temperature measurement of water at 85m depth
### Aliases: watertemp
### Keywords: datasets

### ** Examples

if(require(zoo)) {
data(watertemp)	 
plot(watertemp)
acf(watertemp)
acf(diff(watertemp))
}



