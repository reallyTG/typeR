library(bmeta)


### Name: bmeta
### Title: Bayesian Meta Analysis/Meta-regression
### Aliases: bmeta bmeta.default
### Keywords: Bayesian meta-analysis

### ** Examples

### Read and format the data (binary)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-bin.csv"))

### List data for binary outcome (for meta-analysis)
d1 <- data.list <- list(y0=data$y0,y1=data$y1,n0=data$n0,n1=data$n1) 

### List data for binary outcome when there is a covariate (for meta-regression)
d1 <- data.list <- list(y0=data$y0,y1=data$y1,n0=data$n0,n1=data$n1,X=cbind(data$X0)) 

### Select fixed-effects meta-analysis with normal prior for binary data 
m1 <- bmeta(d1, outcome="bin", model="std.norm", type="fix",n.iter=100)

### Select random-effects meta-regression with t-distribution prior for binary
### data
m2 <- bmeta(data.list, outcome="bin", model="reg.dt", type="ran",n.iter=100)



### Read and format the data (continuous)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-ctns.csv"))

### List data for continuous outcome for studies reporting two arms separately
### (for meta-analysis)
d1 <- data.list <- list(y0=data$y0,y1=data$y1,se0=data$se0,se1=data$se1) 

### List data for continuous outcome for studies reporting mean difference and 
### variance with a covariate (for meta-regression)
d2 <- data.list2 <- list(y=data$y,prec=data$prec,X=cbind(data$X0))

### Select fixed-effects meta-analysis with studies reporting information of 
### both arm for continuous data 
m1 <- bmeta(data.list, outcome="ctns", model="std.ta", type="fix",n.iter=100)

### Select random-effects meta-regression with studies reporting mean difference and 
### variance only for continuous data
m2 <- bmeta(data.list2, outcome="ctns", model="reg.mv", type="ran",n.iter=100)



### Read and format the data (count)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-count.csv"))  

### List data for count outcome (for meta-analysis)
d1 <- data.list <- list(y0=data$y0,y1=data$y1,p0=data[,6],p1=data[,10])

### List data for count outcome when there is a covariate (for meta-regression)
d2 <- data.list <- list(y0=data$y0,y1=data$y1,p0=data[,6],p1=data[,10],X=cbind(data$X0)) 

### Select fixed-effects meta-analysis for count data
m1 <- bmeta(d1, outcome="count", model="std", type="fix",n.iter=100)

### Select random-effects meta-analysis with half-Cauchy prior for count data
m2 <- bmeta(d1, outcome="count", model="std.hc", type="ran",n.iter=100)

### Select random-effects meta-regression with uniform prior for count data
m3 <- bmeta(d2, outcome="count", model="reg.unif", type="ran",n.iter=100)




