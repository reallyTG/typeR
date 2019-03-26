library(xpose4)


### Name: xpose.plot.default
### Title: The Xpose 4 generic functions for continuous y-variables.
### Aliases: xpose.plot.default
### Keywords: methods

### ** Examples


## Not run: 
##D ## xpdb5 is an Xpose data object
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
##D 
##D ## A spaghetti plot of DV vs TIME
##D xpose.plot.default("TIME", "DV", xpdb5) 
##D 
##D ## A conditioning plot
##D xpose.plot.default("TIME", "DV", xpdb5, by = "SEX")
##D  
##D ## Multiple x-variables
##D xpose.plot.default(c("WT", "SEX"), "CL", xpdb5)
##D 
##D ## Multiple y-variables
##D xpose.plot.default("WT", c("CL", "V"), xpdb5)
##D xpose.plot.default("WT", c("CL", "V"), xpdb5, by=c("SEX", "HCTZ"))
##D 
##D ## determining the interval for the conditioning variable
##D wt.ints <- matrix(c(50,60,60,70,70,80,80,90,90,100,100,150),nrow=6,ncol=2,byrow=T)
##D xpose.plot.default("TIME","DV",xpdb5,by="WT", by.interval=wt.ints)
## End(Not run)





