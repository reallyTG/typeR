library(nonmem2R)


### Name: vpcfig3
### Title: Visual Predictive Check (VPC) based on raw Perl-speaks-NONMEM
###   (PsN) generated VPC files.
### Aliases: vpcfig3

### ** Examples

# Get path to the example files included in nonmem2R package
file1 <- system.file("extdata", "sdtab", package = "nonmem2R")
file2 <- system.file("extdata", "DV_matrix.csv", package = "nonmem2R")

#load sdtab and matrix file
sdtab<-read.table(file=file1,skip=1,header=TRUE)
vpc<-read.table(file=file2,header=FALSE,sep=",")

# VPC stratified by gender
vpcfig3(sdtab,vpc,dv="DV",idvs="TAD",strata="SEX")

# create new strata variable and do VPC
sdtab$age.group<-cut(sdtab$AGE,c(22,30,50))
vpcfig3(sdtab,vpc,dv="DV",idvs="TAD",strata="age.group")



