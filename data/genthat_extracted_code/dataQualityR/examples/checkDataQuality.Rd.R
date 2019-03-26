library(dataQualityR)


### Name: checkDataQuality
### Title: checkDataQuality
### Aliases: checkDataQuality

### ** Examples

data(crx)
num.file <- paste(tempdir(), "/dq_num.csv", sep= "")
cat.file <- paste(tempdir(), "/dq_cat.csv", sep= "")
checkDataQuality(data= crx, out.file.num= num.file, out.file.cat= cat.file)



