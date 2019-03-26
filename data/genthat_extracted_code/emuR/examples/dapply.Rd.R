library(emuR)


### Name: dapply
### Title: apply a function to each part of a trackdata object
### Aliases: dapply
### Keywords: misc

### ** Examples



data(dip)
## formant data of the first segment in segment list dip
fm <- dip.fdat[1]

testfun <- function(data, ftime, n) {
  ## return only the first n rows of data
  ## doesn't check to see if there really are n rows...
  newdata <- data[1:n,]
  ## calculate a new end time
  interval <- (ftime[2]-ftime[1])/nrow(data)
  ftime[2] <- ftime[1] + interval*n
  ## now return the required list 
  return( list( data=newdata, ftime=ftime ) )
}

fm.first3 <- dapply( fm, testfun, 3 )
fm.first10 <- dapply( fm, testfun, 10 )





