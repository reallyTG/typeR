library(bmeta)


### Name: posterior.plot
### Title: Posterior distribution plots for summary estimates and
###   between-study standard deviation (measurement of heterogeneity)
### Aliases: posterior.plot
### Keywords: Bayesian meta-analysis

### ** Examples

### Read and format the data (binary)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-bin.csv"))

### List data for binary outcome 
data.list <- list(y0=data$y0,y1=data$y1,n0=data$n0,n1=data$n1)

### Select random-effects meta-analysis with t-distribution prior for binary
### data
x <- bmeta(data.list, outcome="bin", model="std.dt", type="ran")

### using output from bmeta to produce posterior plot
posterior.plot(x)

### using output from bmeta and specify the horizontal limits 
posterior.plot(x,xlim=c(-2,1))

### using output from bmeta on natural scale and specify more options 
posterior.plot(x,xlim=c(-0.5,2.5),xlab="odds ratio",main="Posterior distribution
of pooled odds ratio", scale="exp")

### examine heterogeneity by producing posterior plot for between-study standard
### deviation
posterior.plot(x,heterogeneity=TRUE,xlim=c(0,3),xlab="between-study standard 
deviation")




