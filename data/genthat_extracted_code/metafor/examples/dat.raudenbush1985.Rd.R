library(metafor)


### Name: dat.raudenbush1985
### Title: Studies on Assessing the Effects of Teacher Expectations on
###   Pupil IQ
### Aliases: dat.raudenbush1985
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.raudenbush1985))

### random-effects model
res <- rma(yi, vi, data=dat)
res

### create weeks variable where values larger than 3 are set to 3
dat$weeks.c <- ifelse(dat$week > 3, 3, dat$week)

### mixed-effects model with weeks.c variable as moderator
res <- rma(yi, vi, mods=~weeks.c, data=dat, digits=3)
res



