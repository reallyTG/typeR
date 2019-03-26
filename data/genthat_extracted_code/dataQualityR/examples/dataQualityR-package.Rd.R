library(dataQualityR)


### Name: dataQualityR-package
### Title: Performs variable level data quality checks and generates
###   summary statistics
### Aliases: dataQualityR-package dataQualityR
### Keywords: package

### ** Examples

data(crx)
num.file <- paste(tempdir(), "/dq_num.csv", sep= "")
cat.file <- paste(tempdir(), "/dq_cat.csv", sep= "")
checkDataQuality(data= crx, out.file.num= num.file, out.file.cat= cat.file)



