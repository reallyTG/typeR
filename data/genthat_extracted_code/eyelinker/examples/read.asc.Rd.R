library(eyelinker)


### Name: read.asc
### Title: Read EyeLink ASC file
### Aliases: read.asc

### ** Examples

#Example file from SR research that ships with the package
fpath <- system.file("extdata/mono500.asc.gz",package="eyelinker")
dat <- read.asc(fpath)
plot(dat$raw$time,dat$raw$xp,xlab="Time (ms)",ylab="Eye position along x axis (pix)")



