library(nonmem2R)


### Name: vpcfig
### Title: Visual Predictive Check (VPC) based on Perl-speaks-NONMEM (PsN)
###   generated VPC files (lattice version).
### Aliases: vpcfig

### ** Examples


# Get path to the example files included in nonmem2R package
file1 <- system.file("extdata", "vpctab004.dat", package = "nonmem2R")
file2 <- system.file("extdata", "vpc_results.csv", package = "nonmem2R")


# Ex 1, produce VPC with default setting, here specifying both vpctab and vpcresult
vpcfig(vpctab=file1,vpcresult=file2)

## Not run: 
##D # Ex 2, produce VPC with default setting, here specifying only directory of vpc files
##D path1<-gsub("vpctab004.dat","",file1)
##D vpcfig(vpcdir=path1)
## End(Not run)

# Ex 3, produce VPC with i) modifies strata names, ii) strata in reverse order, and
#        iii) labels
strata.names<-c("Group A","Group B")
xlab<-"Time after dose (hrs)"
ylab<-"Plasma Conc(mmol/L)"
vpcfig(vpctab=file1,vpcresult=file2,strata.names=strata.names,strata.subset=2:1,
       xlab=xlab,ylab=ylab)



