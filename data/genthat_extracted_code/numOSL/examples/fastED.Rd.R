library(numOSL)


### Name: fastED
### Title: Fast-component equivalent dose calculation
### Aliases: fastED fastED.default
### Keywords: decay curve growth curve equivalent dose

### ** Examples

 ### Example 1 (not run):
 # data(Signaldata)
 # fastED(Signaldata$cw,Redose=c(80,160,240,320,0, 80)*0.13,
 #        ncomp=3, constant=FALSE, outpdf="fastED1")

 ### Example 2 (not run):
 # data(BIN)
 # obj_pickBIN <- pickBINdata(BIN, Position=6, Grain=0, 
 #                            LType="OSL", force.matrix=TRUE)
 # fastED(obj_pickBIN$BINdata[[1]], ncomp=2, constant=TRUE,
 #        Redose=c(100,200,300,400,0,100)*0.13, outpdf="fastED2")




