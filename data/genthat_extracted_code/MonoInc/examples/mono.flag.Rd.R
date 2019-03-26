library(MonoInc)


### Name: mono.flag
### Title: Flag
### Aliases: mono.flag
### Keywords: flag

### ** Examples

data(simulated_data)
simulated_data <- simulated_data[1:1000,]
data(data.r)
## run mono.flag function 
test <- mono.flag(simulated_data, 1, 2, 3, 30, 175, data.r=data.r, direction='inc')
head(test)




