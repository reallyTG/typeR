library(plmm)


### Name: var.plot
### Title: Nonparametric Variance Function Estimation and Plotting
### Aliases: var.plot

### ** Examples

data(plmm.data)
model <- plmm(y1~x1+x2+x3|t1, random=cluster, data=plmm.data)
var.plot(model, heteroX=x3, data=plmm.data)
result <- var.plot(model, heteroX=x3, data=plmm.data, display="none")
result$var.fun.values



