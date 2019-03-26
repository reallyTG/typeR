library(changepoint)


### Name: cpt.range-class
### Title: Class "cpt.range"
### Aliases: cpt.range-class
### Keywords: classes cpt internal

### ** Examples

showClass("cpt.range") # shows the structure of the cpt.range class

x=new("cpt.range") # creates a new object with the cpt.range class defaults
cpts(x) # retrieves the cpts slot from x
cpts(x)<-c(10,50,100) # replaces the cpts slot from x with c(10,50,100)

# Example of multiple changes in variance at 50,100,150 in simulated normal data
set.seed(1)
x=c(rnorm(50,0,1),rnorm(50,0,10),rnorm(50,0,5),rnorm(50,0,1))
out=cpt.var(x,pen.value=c(log(length(x)),10*log(length(x))),penalty="CROPS",method="PELT")
print(out) # prints details of the analysis including a summary
summary(out)
plot(out,diagnostic=TRUE) # a diagnostic plot to identify number of changepoints
# looks like the segmentation with 3 changepoints, 50,99,150 is the most appropriate
plot(out,ncpts=3) # plots the segmentation for 3 changes
logLik(out,ncpts=3) 
# raw likelihood of the data with changepoints, second value is likelihood + penalty



