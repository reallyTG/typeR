library(climatol)


### Name: homogsplit
### Title: Apply homogen() on overlapping rectangular areas.
### Aliases: homogsplit
### Keywords: datagen

### ** Examples

#Set a temporal working directory and write input files:
wd <- tempdir()
wd0 <- setwd(wd)
data(Ptest)
dim(dat) <- c(720,20)
dat[601:720,5] <- dat[601:720,5]*1.8
write(dat[481:720,1:12],'pcp_1991-2010.dat')
write.table(est.c[1:12,1:5],'pcp_1991-2010.est',row.names=FALSE,col.names=FALSE)
#Now run the example:
homogsplit('pcp',1991,2010,2.9,39.6,0,0,std=2)
#Return to user's working directory:
setwd(wd0)
#Input and output files can be found in directory:
print(wd)
#
# Note that this is just a trivial example; this function is intended to
# homogenize a network of thousands of long series which might overload
# computer resources, and is still experimental.



