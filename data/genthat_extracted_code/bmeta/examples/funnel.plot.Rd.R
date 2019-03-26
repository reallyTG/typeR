library(bmeta)


### Name: funnel.plot
### Title: Funnel plot to examine publication bias
### Aliases: funnel.plot
### Keywords: Funnel plot

### ** Examples

### Read and format the data (binary)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-bin.csv"))

### List data for binary outcome 
data.list <- list(y0=data$y0,y1=data$y1,n0=data$n0,n1=data$n1) 

### Select random-effects meta-analysis with t-distribution prior for binary
### data
x <- bmeta(data.list, outcome="bin", model="std.dt", type="ran")

### using output from bmeta to produce funnel plot 
funnel.plot(x)

### using output from bmeta and specify title of the plot 
funnel.plot(x,title="funnel plot")

### using output from bmeta and specify the limit of x-axis and title
funnel.plot(x,title="funnel plot",xlim=c(-2,1))



