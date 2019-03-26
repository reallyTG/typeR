library(metafor)


### Name: predict.rma
### Title: Predicted Values for 'rma' Objects
### Aliases: predict.rma
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### average risk ratio with 95% CI
predict(res, transf=exp)

### mixed-effects model with absolute latitude as a moderator
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, mods = ~ ablat,
           data=dat.bcg)

### predicted average risk ratios for given absolute latitude values
predict(res, transf=exp, addx=TRUE)

### predicted average risk ratios for 10-60 degrees absolute latitude
predict(res, newmods=c(10, 20, 30, 40, 50, 60), transf=exp)

### mixed-effects model with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + year, data=dat.bcg)

### predicted average risk ratios for 10 and 60 degrees latitude in 1950 and 1980
predict(res, newmods=cbind(c(10,60,10,60),c(1950,1950,1980,1980)), transf=exp, addx=TRUE)

### mixed-effects model with two moderators (one of which is a factor)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + factor(alloc), data=dat.bcg)

### examine how the factor was actually coded for the studies in the dataset
predict(res, addx=TRUE)

### predictd average risk ratios at 30 degrees for the three factor levels
### note: the contrast (dummy) variables need to specified explicitly here
predict(res, newmods=c(30, 0, 0), addx=TRUE)   # for alternate  allocation
predict(res, newmods=c(30, 1, 0), addx=TRUE)   # for random     allocation
predict(res, newmods=c(30, 0, 1), addx=TRUE)   # for systematic allocation

### can also use named vector with arbitrary order and abbreviated variable names
predict(res, newmods=c(sys=0, ran=0, abl=30))
predict(res, newmods=c(sys=0, ran=1, abl=30))
predict(res, newmods=c(sys=1, ran=0, abl=30))



