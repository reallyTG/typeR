library(SDMTools)


### Name: asc2dataframe
### Title: Ascii Grid Files to Dataframe and Dataframe to Ascii Grid Files
### Aliases: asc2dataframe dataframe2asc

### ** Examples

#Create 2 ascii files
y=seq(10,50,0.5)
x=seq(140,180,0.5)
cellsize=0.5
data1=sample(160,140)
data2=sample(158,140)
out1.asc=as.asc(matrix(data1,nc=y, nr=x), xll=min(x), yll=min(y), cellsize=cellsize)
out2.asc=as.asc(matrix(data2,nc=y, nr=x), xll=min(x), yll=min(y), cellsize=cellsize)
#write the ascii files to the work directory
write.asc(out1.asc, 'out1.asc')
write.asc(out2.asc, 'out2.asc')
#list the ascii files
ascfiles=c('out1.asc', 'out2.asc')
#generate a dataframe from the ascii files
tdata=asc2dataframe(ascfiles)
tdata

#remove the files
unlink('out1.asc'); unlink('out2.asc')

#convert the dataframe tdata to ascii grid files
dataframe2asc(tdata)

#remove the files
unlink('var.1.asc'); unlink('var.2.asc')



