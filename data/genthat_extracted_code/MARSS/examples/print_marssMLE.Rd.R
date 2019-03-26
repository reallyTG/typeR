library(MARSS)


### Name: print.marssMLE
### Title: Printing functions for MARSS MLE objects
### Aliases: print print.MARSS print.marssMLE

### ** Examples
 
  dat = t(harborSeal)
  dat = dat[c(2,11),]
  MLEobj = MARSS(dat)
  
  print(MLEobj)
  
  print(MLEobj,what="model")
  
  print(MLEobj,what="par")
  
  #silent doesn't mean silent unless the print output is assigned
  print(MLEobj,what="paramvector", silent=TRUE)
  tmp=print(MLEobj,what="paramvector", silent=TRUE)
  #silent means some info on what you are printing is shown whether
  #or not the print output is assigned
  print(MLEobj,what="paramvector", silent=FALSE)
  tmp=print(MLEobj,what="paramvector", silent=FALSE)
  
  cis=print(MLEobj,what="states.cis")
  cis$up95CI
  
  vars=print(MLEobj, what=c("R","Q"))



