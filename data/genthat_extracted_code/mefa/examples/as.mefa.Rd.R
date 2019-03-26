library(mefa)


### Name: as.mefa
### Title: Conversion Among Various Object Classes
### Aliases: as.Mefa as.Xtab as.mefa as.mefa.default as.mefa.array
###   as.mefa.list as.stcs as.stcs.default as.data.frame.stcs as.array.mefa
###   as.list.mefa as.matrix.mefa as.data.frame.mefa mss msr mts mtr
### Keywords: methods manip

### ** Examples

data(dol.count, dol.samp, dol.taxa)
x <- mefa(stcs(dol.count), dol.samp, dol.taxa)
## These two are equivalent
as.data.frame(x, fun = mss)
mss(x)
## Return only two species
as.data.frame(x, fun = msr, c("iiso", "ppyg"))
## Taxa table and summary
as.data.frame(x, fun = mts)
## Taxa table and raw data transpose
as.data.frame(x, fun = mtr)
## Why is it useful?
## Instead of
glm(x$xtab[,"amin"] ~ microhab + method, data = x$samp, family = poisson)
## it is more convenient to use
glm(amin ~ microhab + method, data = msr(x), family = poisson)



