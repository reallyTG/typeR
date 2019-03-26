library(xpose4)


### Name: xpose.VPC.categorical
### Title: Xpose visual predictive check for categorical data.
### Aliases: xpose.VPC.categorical
### Keywords: methods

### ** Examples


## Not run: 
##D library(xpose4)
##D 
##D ## move to the directory where results from PsN
##D ## are found
##D cur.dir <- getwd()
##D setwd(paste(cur.dir,"/binary/vpc_36",sep=""))
##D 
##D xpose.VPC.categorical(level.to.plot=1,max.plots.per.page=4)
##D xpose.VPC.categorical(level.to.plot=1,max.plots.per.page=4,by="DOSE")
##D 
##D ## ordered categorical plots
##D setwd(paste(cur.dir,"/ordered_cat/vpc_45",sep=""))
##D xpose.VPC.categorical()
##D 
##D 
##D ## count
##D setwd(paste(cur.dir,"/count/vpc65b",sep=""))
##D xpose.VPC.categorical()
##D 
##D setwd(paste(cur.dir,"/count/vpc65a",sep=""))
##D xpose.VPC.categorical()
##D 
## End(Not run)




