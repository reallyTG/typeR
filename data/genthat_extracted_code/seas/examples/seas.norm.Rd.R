library(seas)


### Name: seas.norm
### Title: Calculate annual and seasonal 'normal' statistics, including
###   precipitation normals
### Aliases: seas.norm precip.norm
### Keywords: datagen

### ** Examples

data(mscdata)

# calculate precipitation normal
dat <- mksub(mscdata, id=1108447)
dat.ss <- seas.sum(dat)
dat.nm <- precip.norm(dat.ss, fun="mean")

# plot precipitation normal
plot(dat.nm) # this is the same as plot.precip.norm(dat.nm)

# use precipitation normal
dat.dep <- precip.dep(dat, dat.nm)
plot(dep ~ date, dat.dep, type="l",
     main="CPD from mean normals")



