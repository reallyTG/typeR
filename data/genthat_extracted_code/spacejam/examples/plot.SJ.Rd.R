library(spacejam)


### Name: plot.SJ
### Title: plot an object of class 'SJ' or 'SJ.dag'
### Aliases: plot.SJ plot.SJ.dag

### ** Examples

p <- 100 #variables
n <- 50 #observations

#Generate Data
set.seed(20)
g <- rdag(p,80)
data <- generate.dag.data(g,n,basesd=c(1,0.5,0.5))
X <- data$X

#Fit conditional independence graph for sequence of 10 lambdas
fit1 <- SJ(X, length = 10)

par(mfrow=c(1,2))
layout <- plot(fit1, main = "min BIC")
plot(fit1, which=5, layout = layout, main = paste0("lambda = ",round(fit1$lambda[5],3)))



