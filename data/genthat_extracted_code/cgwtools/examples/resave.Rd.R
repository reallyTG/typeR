library(cgwtools)


### Name: resave
### Title: Add some objects to an existing '.Rdata' - type file.
### Aliases: resave

### ** Examples

foo<-1:4
bar<-5:8
save(foo,file='foo.Rdata')
resave(bar,file='foo.Rdata')
#check your work
lsdata('foo.Rdata')



