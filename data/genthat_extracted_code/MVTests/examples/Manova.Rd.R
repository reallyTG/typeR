library(MVTests)


### Name: Manova
### Title: One Way Multivariate Analysis of Variance (MANOVA)
### Aliases: Manova

### ** Examples


data(iris)

# Wilk's Test
results.Wilks <- Manova(data=iris[,1:4],group=iris[,5],alpha=0.01)
summary(results.Wilks)

# Pillai's Test
results.Pillai <- Manova(data=iris[,1:4],group=iris[,5],method="Pillai")
summary(results.Pillai)
 
# Hotelling and Lawley's Test
results.HL <- Manova(data=iris[,1:4],group=iris[,5], method="Hotelling-Lawley")
summary(results.HL)

# Roy's Test
results.Roy <- Manova(data=iris[,1:4],group=iris[,5], method="Roy")
summary(results.Roy)
results.RoyCI <- Manova(data=iris[,1:4],group=iris[,5], method="Roy",CI=TRUE)
summary(results.RoyCI)

# James's Test
results.James <- Manova(data=iris[,1:4],group=iris[,5],Homogeneity=FALSE)
summary(results.James)



