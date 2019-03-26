library(reReg)


### Name: reSurv
### Title: Create an 'reSurv' Object
### Aliases: reSurv is.reSurv

### ** Examples

data(readmission, package = "frailtypack")
attach(readmission)
reSurv(t.stop, id, event, death)
reSurv(t.start, t.stop, id, event, death)
detach(readmission)



