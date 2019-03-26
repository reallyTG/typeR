library(stmgp)


### Name: stmgplink
### Title: Smooth-threshold multivariate genetic prediction for genome-wide
###   association or whole-genome sequencing data in PLINK format
### Aliases: stmgplink
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D wd = system.file("extdata",package="stmgp")
##D 
##D # quantitive traits
##D # training data (plink format)
##D trainbed = paste(wd,"train",sep="/")
##D # test data (plink format)
##D testbed = paste(wd,"test",sep="/")
##D # number of SNPs
##D #n.snp = length(readLines(paste(trainbed,".bim",sep="")))
##D n.snp = 80000
##D 
##D # model building from training data without covariates
##D sp1 = stmgplink(trainbed=trainbed,maxal=3000/n.snp)
##D head(sp1$PE)
##D 
##D # model building from training data to predict test data without covariates
##D sp2 = stmgplink(trainbed=trainbed,testbed=testbed,maxal=3000/n.snp)
##D head(sp2$PEte)
##D sp2$nonzero
##D 
##D # covariates files
##D # covariates (PLINK's covariate format, training data)
##D Z = as.matrix(read.table(paste(wd,"train.cov",sep="/"),h=TRUE)[,-(1:2)])
##D # covariates (PLINK's covariate format, test data)
##D Zte = as.matrix(read.table(paste(wd,"test.cov",sep="/"),h=TRUE)[,-(1:2)])
##D 
##D # model building from training data
##D sp3 = stmgplink(trainbed=trainbed,maxal=3000/n.snp,Z=Z)
##D head(sp3$PE)
##D 
##D # model building from training data and predicting test data
##D sp4 = stmgplink(trainbed=trainbed,testbed=testbed,maxal=3000/n.snp,Z=Z,Zte=Zte)
##D head(sp4$PEte)
##D sp4$nonzero
## End(Not run)




