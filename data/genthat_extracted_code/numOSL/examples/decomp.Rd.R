library(numOSL)


### Name: decomp
### Title: OSL decay curve decomposition
### Aliases: decomp decomp.default
### Keywords: decay curve

### ** Examples

 ### Example 1:
 data(Signaldata)
 decomp(Signaldata$lm,ncomp=3,typ="lm",
        control.args=list(maxiter=10))

 ### Example 2 (not run):
 # data(BIN)
 # obj_pickBIN <- pickBINdata(BIN, Position=2, Run=2, view=TRUE,
 #                            LType="OSL", force.matrix=TRUE)
 # decomp(obj_pickBIN$BINdata[[1]], ncomp=2, log="xy")



