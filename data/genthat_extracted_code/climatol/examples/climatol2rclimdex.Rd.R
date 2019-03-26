library(climatol)


### Name: climatol2rclimdex
### Title: Convert DAILY data from Climatol to RClimDex input format
### Aliases: climatol2rclimdex

### ** Examples

#Set a temporal working directory and generate input files:
wd <- tempdir()
wd0 <- setwd(wd)
data(tmax)
write.table(est.c,'Tmax_2001-2003.est',row.names=FALSE,col.names=FALSE)
write(dat,'Tmax_2001-2003.dat')
homogen('Tmax',2001,2003,snht1=30)
#Now run the example:
climatol2rclimdex('','Tmax','',2001,2003)
#Return to user's working directory:
setwd(wd0)
#Input and output files can be found in directory:
print(wd)
#(RR and TX columns are filled with missing data codes, because we do not have
#provided Climatol homogenization results for those variables.)



