library(dmm)


### Name: make.dmmobj
### Title: Construct an object of class 'dmm' from user-supplied data
### Aliases: make.dmmobj
### Keywords: manip

### ** Examples

library(dmm)
p <- matrix(c(3,2,2,4),2,2)
dimnames(p) <- list(c("T1","T2"),c("T1","T2"))
gia <- matrix(c(2,1,1,3),2,2)
dimnames(gia) <- dimnames(p)
myobj <- make.dmmobj(p,components=c("VarG(Ia)"),gia)
myresp <- gresponse(myobj,psd=list(dp=c(0.5,0.1)))
print(myresp)
#cleanup
rm(p)
rm(gia)
rm(myobj)
rm(myresp)




