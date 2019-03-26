library(cwhmisc)


### Name: SplomT
### Title: splom with title and time stamp
### Aliases: SplomT
### Keywords: hplot

### ** Examples

  nc <- 8 # number of columns 
  nr <- 250 # number of rows
  data <- as.data.frame(matrix(rnorm(nr*nc),nrow=nr,ncol=nc))
  data[,nc]   <- data[,nc-2] + 0.3*data[,nc-1] #generate higher correlations
  data[,nc-1] <- data[,nc-1] + 0.9*data[,nc]
  colnames(data)<-paste("vw",letters[1:nc],sep="")
  SplomT(data,mainL="",hist="d",cex.diag=0.6,hist.col="green")
  SplomT(data,mainL="",hist="b",adjust=0.4,cex.diag = 0.5)



