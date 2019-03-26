library(xpose4)


### Name: xpose.VPC.both
### Title: Xpose Visual Predictive Check (VPC) for both continuous and
###   Limit of Quantification data.
### Aliases: xpose.VPC.both
### Keywords: methods

### ** Examples


## Not run: 
##D library(xpose4)
##D 
##D ## move to the directory where results from PsN
##D ## are found
##D cur.dir <- getwd()
##D setwd(paste(cur.dir,"/vpc_cont_LLOQ/",sep=""))
##D 
##D xpose.VPC()
##D xpose.VPC.categorical(censored=T)
##D 
##D xpose.VPC.both()
##D 
##D xpose.VPC.both(subset="DV>1.75")
##D 
##D xpose.VPC.both(add.args.cont=list(ylim=c(0,80)))
##D 
##D xpose.VPC.both(add.args.cont = list(ylim = c(0.01, 80)), xlim = c(0, 
##D     40), add.args.cat = list(ylim = c(0, 0.4)), cont.logy = T)
##D 
##D xpose.VPC.both(cont.logy=T)
## End(Not run)




