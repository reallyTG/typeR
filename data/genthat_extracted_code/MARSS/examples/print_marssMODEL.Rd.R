library(MARSS)


### Name: print.marssMODEL
### Title: Printing marssMODEL Objects
### Aliases: print.marssMODEL summary.marssMODEL describe.marssMODEL

### ** Examples
 
  dat <- t(harborSeal)
  dat <- dat[c(2,11),]
  MLEobj <- MARSS(dat)

  print(MLEobj$model)
  #this is identical to 
  print(MLEobj, what="model")



