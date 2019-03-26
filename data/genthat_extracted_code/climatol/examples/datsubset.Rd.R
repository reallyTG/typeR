library(climatol)


### Name: datsubset
### Title: Subset Climatol input data into new files
### Aliases: datsubset
### Keywords: datagen

### ** Examples

#Set a temporal working directory and write input files:
wd <- tempdir()
wd0 <- setwd(wd)
data(Ptest)
write(dat,'Ptest_1951-2010.dat')
write.table(est.c, 'Ptest_1951-2010.est', row.names=FALSE, col.names=FALSE)
rm(dat,est.c) #remove loaded data from memory space
datsubset('Ptest',1951,2010,1971,2000,20)
#Return to user's working directory:
setwd(wd0)
#Input and output files can be found in directory:
print(wd)



