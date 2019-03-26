library(bmeta)


### Name: acf.plot
### Title: Autocorrelation function plot
### Aliases: acf.plot
### Keywords: Autocorrelation MCMC

### ** Examples

### Read and format the data (binary)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-bin.csv"))

### List data for binary outcome 
data.list <- list(y0=data$y0,y1=data$y1,n0=data$n0,n1=data$n1) 

### generate output from bmeta 
x <- bmeta(data=data.list,outcome="bin",model="std.dt",type="ran")

### generate autocorrelation function plot 
acf.plot(x,"alpha[1]")

### generate autocorrelation function plot and specify the title 
acf.plot(x,"alpha[1]",title="Autocorrelation plot")



