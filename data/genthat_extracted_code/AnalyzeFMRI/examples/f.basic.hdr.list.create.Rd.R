library(AnalyzeFMRI)


### Name: f.basic.hdr.list.create
### Title: creates basic .hdr list in ANALYZE format
### Aliases: f.basic.hdr.list.create
### Keywords: utilities

### ** Examples

a<-array(rnorm(20*30*40*3),dim=c(20,30,40,3))
file<-"temp.hdr"
f.basic.hdr.list.create(a, file)



