library(ergm.ego)


### Name: mixingmatrix.egodata
### Title: Summarizing the mixing among groups in an egocentric dataset
### Aliases: mixingmatrix.egodata

### ** Examples


data(faux.mesa.high)
fmh.ego <- as.egodata(faux.mesa.high)

(mm <- mixingmatrix(faux.mesa.high,"Grade"))
(mm.ego <- mixingmatrix.egodata(fmh.ego,"Grade"))

stopifnot(isTRUE(all.equal({tmp<-unclass(mm$matrix); diag(tmp) <- diag(tmp)*2;
tmp}, mm.ego, check.attributes=FALSE)))




