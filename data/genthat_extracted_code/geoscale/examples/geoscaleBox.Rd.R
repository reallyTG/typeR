library(geoscale)


### Name: geoscaleBox
### Title: Geological box plots.
### Aliases: geoscaleBox
### Keywords: time-series,plot

### ** Examples


## Plotting data from a matrix

 data1 <- matrix(ncol=10,nrow=30,data=runif(30,0,100))
  ages <- seq(10,100,10)
    geoscaleBox(data1,ages,boxes="Age",pch=19,box.width=2)    

## Plotting data from a list
 
 data2 <- vector("list",10)
  for(d in 1:length(data2)){
  	data2[[d]] <- runif(30,0,100)
  }
	ages <- seq(10,100,10)
     geoscaleBox(data2,ages,boxes="Age",pch=19,box.width=2)    

## Example dataset

 data(size)
  ages <- as.numeric(colnames(size))
   geoscaleBox(data=size,ages=ages,pch=19,boxes="Age")

# Plotting on a log scale
   geoscaleBox(data=size,ages=ages,pch=19,boxes="Age",log=TRUE)




