library(MonoInc)


### Name: MonoInc
### Title: Monotonic Increasing
### Aliases: MonoInc
### Keywords: monotonic mono

### ** Examples

data(simulated_data)
simulated_data <- simulated_data[1:1000,]
data(data.r)
library(sitar)

## Run MonoInc
sum <- MonoInc(simulated_data, 1,2,3, data.r,5,direction='inc', w1=0.3, min=30, max=175, 
    impType1=NULL, impType2=NULL, sum=TRUE)
head(sum)
test <- MonoInc(simulated_data, 1,2,3, data.r,5,direction='inc', w1=0.3, min=30, max=175, 
    impType1="nn", impType2="fr")
head(test)

## plot longitudinal height for each id
mplot(x=X, y=Nn.Fr, data=test)
tol <- 5
lines(data.r[,1], data.r[,2]-tol, col=2, lty=2)
lines(data.r[,1], data.r[,3]+tol, col=2, lty=2)



