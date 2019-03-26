library(fma)


### Name: milk
### Title: Monthly milk production per cow
### Aliases: milk
### Keywords: datasets

### ** Examples
par(mfrow=c(2,1))
plot(milk,xlab="Year",ylab="pounds",
    main="Monthly milk production per cow")
milk.adj <- milk/monthdays(milk)*365.25/12
plot(milk.adj,xlab="Year",ylab="pounds",
    main="Adjusted monthly milk production per cow")



