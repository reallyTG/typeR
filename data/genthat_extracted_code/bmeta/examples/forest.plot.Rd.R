library(bmeta)


### Name: forest.plot
### Title: Function to create forest plot
### Aliases: forest.plot
### Keywords: Forest plot

### ** Examples

### Read and format the data (binary)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-bin.csv"))

### List data for binary outcome 
data.list <- list(y0=data$y0,y1=data$y1,n0=data$n0,n1=data$n1) 

### Select fixed-effects meta-analysis with normal prior for binary data 
x <- bmeta(data.list, outcome="bin", model="std.norm", type="fix")

### Plot forest plot 
forest.plot(x)

### Plot forest plot on log scale 
forest.plot(x,log=TRUE)

### Select random-effects meta-analysis with t-distribution prior for binary
### data
x <- bmeta(data.list, outcome="bin", model="std.dt", type="ran")

### Plot 'two-line' forest plot showing estimates from both randome-effects 
### model and no-pooling effects model for comparison
forest.plot(x,add.null=TRUE,title="Two-line forestplot for comparison")


### Read and format the data (continuous)
data = read.csv(url("http://www.statistica.it/gianluca/bmeta/Data-ctns.csv"))

### List data for continuous outcome
data.list <- list(y0=data$y0,y1=data$y1,se0=data$se0,se1=data$se1)  

### Select fix-effects meta-analysis for studies reporting two arms separately
x <- bmeta(data=data.list,outcome="ctns",model="std.ta",type="fix")

### Define for individual studies
study.label <- c(paste0(data$study,", ",data$year),"Summary estimate")

### Produce forest plot with label for each study and control the lower and upper 
### limits for clipping credible intervals to arrows   
forest.plot(x,study.label=study.label,clip=c(-7,4))





