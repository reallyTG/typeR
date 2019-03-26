library(CollapsABEL)


### Name: readPlinkOut
### Title: Read plink output files
### Aliases: readPlinkOut

### ** Examples

## Not run: 
##D dat1 = readPlinkOut("assoc/mmp13.assoc")
##D dat2 =    readAssoc("assoc/mmp13.assoc")
##D all(na.omit(dat1 == dat2))
##D dat1 = readPlinkOut("assoc/mmp13.assoc", c("CHR", "SNP", "P", "OR"))
##D dat2 =    readAssoc("assoc/mmp13.assoc", c("CHR", "SNP", "P", "OR"))
##D all(na.omit(dat1 == dat2))
##D dat1 = readPlinkOut("assoc/mmp13.qassoc")
##D dat2 =   readQassoc("assoc/mmp13.qassoc")
##D all(na.omit(dat1 == dat2))
##D dat1 = readPlinkOut("assoc/mmp13.qassoc", c("CHR", "SNP", "P", "R2"))
##D dat2 =   readQassoc("assoc/mmp13.qassoc", c("CHR", "SNP", "P", "R2"))
##D all(na.omit(dat1 == dat2))
## End(Not run)




