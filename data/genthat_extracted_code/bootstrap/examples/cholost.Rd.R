library(bootstrap)


### Name: cholost
### Title: The Cholostyramine Data
### Aliases: cholost
### Keywords: datasets

### ** Examples

str(cholost)
summary(cholost)
plot(y ~ z, data=cholost, xlab="Compliance", 
            ylab="Improvement")
abline(lm(y ~ z, data=cholost), col="red")



