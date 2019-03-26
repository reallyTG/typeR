library(bmeta)


### Name: traceplot.bmeta
### Title: Traceplot to assess convergence
### Aliases: traceplot.bmeta
### Keywords: MCMC Diagnostics

### ** Examples

### Read and format the data (binary)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-bin.csv"))

### List data for binary outcome 
data.list <- list(y0=data$y0,y1=data$y1,n0=data$n0,n1=data$n1) 

### Select random-effects meta-analysis with t-distribution prior for binary
### data
x <- bmeta(data.list, outcome="bin", model="std.dt", type="ran")


### using output from bmeta to produce traceplot for a specific node
traceplot.bmeta(x,"mu")

### using output from bmeta to produce traceplot and specify the node used
traceplot.bmeta(x,"mu",lab="mu")



