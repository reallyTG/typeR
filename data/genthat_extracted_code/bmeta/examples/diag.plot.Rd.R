library(bmeta)


### Name: diag.plot
### Title: Diagnostic plot to examine model fit
### Aliases: diag.plot
### Keywords: MCMC Diagnostics

### ** Examples

### Read and format the data (binary)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-bin.csv"))

### List data for binary outcome 
data.list <- list(y0=data$y0,y1=data$y1,n0=data$n0,n1=data$n1) 

### generate output using bmeta 
x <- bmeta(data=data.list,outcome="bin",model="std.norm",type="fix")

### run the diagnostic plot to examine the Gelman-Rubin statistic 
diag.plot(x)

### run the diagnostic plot to examine the effective sample size 
diag.plot(x,diag="n.eff")




