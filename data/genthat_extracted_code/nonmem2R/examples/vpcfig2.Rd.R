library(nonmem2R)


### Name: vpcfig2
### Title: Visual Predictive Check (VPC) based on Perl-speaks-NONMEM (PsN)
###   generated VPC files (ggplot2-version).
### Aliases: vpcfig2

### ** Examples


# Get path to the example files included in nonmem2R package
file1 <- system.file("extdata", "vpctab004.dat", package = "nonmem2R")
file2 <- system.file("extdata", "vpc_results.csv", package = "nonmem2R")


# Ex 1, produce VPC with default setting, here specifying both vpctab and vpcresult
vpcfig2(vpctab=file1,vpcresult=file2)

## Not run: 
##D # Ex 2, produce VPC with default setting, here specifying only directory of vpc files
##D path1<-gsub("vpctab004.dat","",file1)
##D vpcfig2(vpcdir=path1)
## End(Not run)

# Ex 3, produce VPC with i) modifies strata names, ii) strata in reverse order, and
#        iii) labels
strata.names<-c("Group A","Group B")
xlab<-"Time after dose (hrs)"
ylab<-"Plasma Conc(mmol/L)"
vpcfig2(vpctab=file1,vpcresult=file2,strata.names=strata.names,strata.subset=2:1,
       xlab=xlab,ylab=ylab)


# Example using the fy argument to transform y-axis setting y-ticks using scale_y_continuous(...)
tmp<-c(1,2,3,4,6)
yticks<-c(0.1,tmp,tmp*10,tmp*100,tmp*1000)
vpcfig2(vpctab=file1,vpcresult=file2,fy=function(y){log(y+1)})+
 scale_y_continuous(breaks=log(yticks+1),labels=yticks,minor_breaks=NULL)

## Not run: 
##D # Example changing to slog-scale using the ggplot2 function scale_y_log10
##D vpcfig2(vpctab=file1,vpcresult=file2)+scale_y_log10()
## End(Not run)
# Example changing y-axis label and adding figure title using ggplot2 function labs(...).
vpcfig2(vpctab=file1,vpcresult=file2)+labs(y="Modified y-label", title="New title")





