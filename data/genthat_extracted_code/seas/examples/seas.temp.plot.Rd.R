library(seas)


### Name: seas.temp.plot
### Title: Plot seasonal temperature normals
### Aliases: seas.temp.plot plot.seas.temp
### Keywords: hplot

### ** Examples

data(mscdata)

dat <- mksub(mscdata, id=1108447)
seas.temp.plot(dat)
seas.temp.plot(dat, width="mon", add.alt=TRUE)

# starting and ending elsewhere
seas.temp.plot(dat, start=18, rep=3)



