library(cgwtools)


### Name: lsdata
### Title: List all objects in an '.Rdata' file.
### Aliases: lsdata

### ** Examples

xblue<-1
yblue<-2
save(xblue,yblue,file='blue.Rdata')
lsdata('blue.Rdata')



