### R code from vignette source 'kst.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: kst.Rnw:59-61
###################################################
options(width = 80)
library("kst")


###################################################
### code chunk number 2: kstructure
###################################################
# An endorelation representing a surmise relation
kst <- endorelation(graph=set(tuple(1,1), tuple(2,2), tuple(3,3),
  tuple(4,4), tuple(2,1), tuple(3,1), tuple(4,1), tuple(3,2), tuple(4,2)))
kstructure(kst)
# A set of sets representing knowledge states (e.g., clauses of a surmise system)
kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
kst


###################################################
### code chunk number 3: set_options
###################################################
sets_options("quote",FALSE)
kst


###################################################
### code chunk number 4: kdomain
###################################################
kdomain(kst)


###################################################
### code chunk number 5: knotions
###################################################
knotions(kst)


###################################################
### code chunk number 6: katoms
###################################################
katoms(kst, items=set("a","b","c"))


###################################################
### code chunk number 7: ktrace
###################################################
ktrace(kst, items=set("c","d","e"))


###################################################
### code chunk number 8: kneighbourhood
###################################################
kneighbourhood(kst, state=set("a", "b"))


###################################################
### code chunk number 9: kfringe
###################################################
kfringe(kst, state=set("a", "b"))


###################################################
### code chunk number 10: kstructure_is_wellgraded
###################################################
kstructure_is_wellgraded(kst)


###################################################
### code chunk number 11: plot
###################################################
if(requireNamespace("Rgraphviz")) {Rgraphviz::plot(kst)}


###################################################
### code chunk number 12: kst.Rnw:200-201
###################################################
if(requireNamespace("Rgraphviz")) {Rgraphviz::plot(kst)}


###################################################
### code chunk number 13: as.relation
###################################################
as.relation(kst)


###################################################
### code chunk number 14: kassess
###################################################
rp <- data.frame(a=c(1,1,0,1,1,1,1,0,0,0),b=c(0,1,0,1,0,1,0,1,0,0),
   c=c(0,0,0,0,1,1,1,0,1,0),d=c(0,0,1,1,1,1,0,0,0,1), e=c(0,0,1,1,1,1,0,0,0,0))
kassess(kst, rpatterns=rp)


###################################################
### code chunk number 15: kvalidate
###################################################
kvalidate(kst, rpatterns=rp, method="gamma")
kvalidate(kst, rpatterns=rp, method="percent")
kvalidate(kst, rpatterns=rp, method="VC")
kvalidate(kst, rpatterns=rp, method="DA")


###################################################
### code chunk number 16: closure
###################################################
closure(kst, operation="union")


###################################################
### code chunk number 17: reduction
###################################################
reduction(kst, operation="discrimination")


###################################################
### code chunk number 18: kfamset
###################################################
# An endorelation representing a surmise relation
# A set of sets representing knowledge states (e.g., clauses of a surmise system)
kfs <- kfamset(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
kfs


###################################################
### code chunk number 19: plotfamset
###################################################
if(requireNamespace("Rgraphviz")) {Rgraphviz::plot(kfs)}


###################################################
### code chunk number 20: kst.Rnw:335-336
###################################################
if(requireNamespace("Rgraphviz")) {Rgraphviz::plot(kfs)}


###################################################
### code chunk number 21: kspace
###################################################
ksp <- kspace(kst)
ksp


###################################################
### code chunk number 22: kstructure_is_space
###################################################
kstructure_is_kspace(ksp)


###################################################
### code chunk number 23: kbase
###################################################
kbase(ksp)


###################################################
### code chunk number 24: lpath
###################################################
lp <- lpath(ksp)
lp


###################################################
### code chunk number 25: lpath_is_gradation
###################################################
lpath_is_gradation(lp)


###################################################
### code chunk number 26: as.famset
###################################################
m <- matrix(c(1, 0, 0, 1, 1, 0), nrow = 2, ncol = 3)
m
as.famset(m)
as.famset(m, as.letters = FALSE)


###################################################
### code chunk number 27: as.matrix
###################################################
as.binaryMatrix(ksp)


