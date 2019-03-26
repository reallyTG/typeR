library(xpose4)


### Name: xpose.VPC
### Title: Visual Predictive Check (VPC) using XPOSE
### Aliases: xpose.VPC
### Keywords: methods

### ** Examples


## Not run: 
##D library(xpose4)
##D 
##D xpose.VPC()
##D 
##D ## to be more clear about which files should be read in
##D vpc.file <- "vpc_results.csv"
##D vpctab <- "vpctab5"
##D xpose.VPC(vpc.info=vpc.file,vpctab=vpctab)
##D 
##D ## with lines and a shaded area for the prediction intervals
##D xpose.VPC(vpc.file,vpctab=vpctab,PI="both")
##D 
##D ## with the percentages of the real data
##D xpose.VPC(vpc.file,vpctab=vpctab,PI.real=T)
##D 
##D ## with mirrors (if supplied in 'vpc.file')
##D xpose.VPC(vpc.file,vpctab=vpctab,PI.real=T,PI.mirror=5)
##D 
##D ## with CIs
##D xpose.VPC(vpc.file,vpctab=vpctab,PI.real=T,PI.ci="area")
##D xpose.VPC(vpc.file,vpctab=vpctab,PI.real=T,PI.ci="area",PI=NULL)
##D 
##D ## stratification (if 'vpc.file' is stratified)
##D cond.var <- "WT"
##D xpose.VPC(vpc.file,vpctab=vpctab)
##D xpose.VPC(vpc.file,vpctab=vpctab,by=cond.var)
##D xpose.VPC(vpctab=vpctab,vpc.info=vpc.file,PI="both",by=cond.var,type="n")
##D 
##D ## with no data points in the plot
##D xpose.VPC(vpc.file,vpctab=vpctab,by=cond.var,PI.real=T,PI.ci="area",PI=NULL,type="n")
##D 
##D ## with different DV and IDV, just read in new files and plot
##D vpc.file <- "vpc_results.csv"
##D vpctab <- "vpctab5"
##D cond.var <- "WT"
##D xpose.VPC(vpctab=vpctab,vpc.info=vpc.file,PI="both",by=cond.var)
##D xpose.VPC(vpctab=vpctab,vpc.info=vpc.file,PI="both")
##D 
##D ## to use an xpose data object instead of vpctab
##D ##
##D ## In this example
##D ## we expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D runnumber <- 5
##D xpdb <- xpose.data(runnumber)
##D xpose.VPC(vpc.file,object=xpdb)
##D 
##D ## to read files in a directory different than the current working directory 
##D vpc.file <- "./vpc_strat_WT_4_mirror_5/vpc_results.csv"
##D vpctab <- "./vpc_strat_WT_4_mirror_5/vpctab5"
##D xpose.VPC(vpc.info=vpc.file,vpctab=vpctab)
##D 
##D ## to rearrange order of factors in VPC plot
##D xpdb@Data$SEX <- factor(xpdb@Data$SEX,levels=c("2","1"))
##D xpose.VPC(by="SEX",object=xpdb)
##D 
## End(Not run)





