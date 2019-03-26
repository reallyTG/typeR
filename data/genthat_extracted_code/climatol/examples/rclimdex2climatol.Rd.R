library(climatol)


### Name: rclimdex2climatol
### Title: Convert RClimDex daily data files to Climatol input format
### Aliases: rclimdex2climatol

### ** Examples

#Set a temporal working directory and write input files:
wd <- tempdir()
wd0 <- setwd(wd)
data(rclimdex)
write.table(rcxsta,'stations.txt',sep='\t',row.names=FALSE,col.names=FALSE,
  quote=FALSE)
write.table(df1,'raxxd000WY003d.txt',row.names=FALSE,col.names=FALSE)
write.table(df2,'raxxd000WY018d.txt',row.names=FALSE,col.names=FALSE)
write.table(df3,'raxxd000WY020d.txt',row.names=FALSE,col.names=FALSE)
#Now run the examples:
rclimdex2climatol('stations.txt',1,'RR',c(9,13))
rclimdex2climatol('stations.txt',2,'TX',c(9,13))
rclimdex2climatol('stations.txt',3,'TN',c(9,13))
#Return to user's working directory:
setwd(wd0)
#Input and output files can be found in directory:
print(wd)



