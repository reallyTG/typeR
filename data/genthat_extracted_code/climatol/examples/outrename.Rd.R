library(climatol)


### Name: outrename
### Title: Rename homogen's output files
### Aliases: outrename
### Keywords: utilities

### ** Examples

#Set a temporal working directory and write input files:
wd <- tempdir()
wd0 <- setwd(wd)
data(Ptest)
dim(dat) <- c(720,20)
dat[601:720,5] <- dat[601:720,5]*1.8
write(dat[481:720,1:5],'pcp_1991-2010.dat')
write.table(est.c[1:5,1:5],'pcp_1991-2010.est',row.names=FALSE,col.names=FALSE)
homogen('pcp',1991,2010,std=2) #homogenization
#Now run the example:
outrename('pcp',1991,2010,'ok')
#Return to user's working directory:
setwd(wd0)
#Input and output files can be found in directory:
print(wd)



