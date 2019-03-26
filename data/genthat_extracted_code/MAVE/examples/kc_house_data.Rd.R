library(MAVE)


### Name: kc_house_data
### Title: House price in King County, USA
### Aliases: kc_house_data
### Keywords: datasets

### ** Examples

data(kc_house_data)
#convert date in string to date in numeric value
kc_house_data[,2]=sapply(kc_house_data[,2],as.double)
train = sample(1:21613)[1:1000]
x.train = as.matrix(kc_house_data[train,c(2,4:21)]) #exclude id, house price
y.train = as.matrix(kc_house_data[train,3]) # house price
x.test  = as.matrix(kc_house_data[-train,c(2,4:21)])
y.test  = as.matrix(kc_house_data[-train,3])



