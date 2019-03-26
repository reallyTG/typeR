library(climatol)


### Name: dd2m
### Title: Compute monthly data from daily series
### Aliases: dd2m
### Keywords: datagen

### ** Examples

#Set a temporal working directory and write input files:
wd <- tempdir()
wd0 <- setwd(wd)
data(Ttest)
write(dat,'Ttest_1981-2000.dat')
write.table(est.c,'Ttest_1981-2000.est',row.names=FALSE,col.names=FALSE)
rm(dat,est.c) #remove loaded data from memory space
#Now run the example:
dd2m('Ttest',1981,2000)
#Return to user's working directory:
setwd(wd0)
#Input and output files can be found in directory:
print(wd)



