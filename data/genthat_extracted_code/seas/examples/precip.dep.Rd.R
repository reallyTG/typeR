library(seas)


### Name: precip.dep
### Title: Cumulative precipitation departure
### Aliases: precip.dep
### Keywords: manip datagen

### ** Examples

data(mscstn)
data(mscdata)

dat <- mksub(mscdata, id=1108447)
dat.ss <- seas.sum(dat)
dat.dep <- precip.dep(dat,precip.norm(dat.ss, fun="mean"))
plot(dep ~ date, dat.dep, type="l", main="CPD from mean normals")

dat.dep <- precip.dep(dat, precip.norm(dat.ss, fun="median"))
plot(dep ~ date, dat.dep, type="l", main="CPD from median normals")



