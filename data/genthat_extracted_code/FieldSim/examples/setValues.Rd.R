library(FieldSim)


### Name: setValues
### Title: Set the values of an object of class 'process'
### Aliases: setValues setValues,process-method

### ** Examples

# Load FieldSim library
library(FieldSim)

#Dataset (to do)
plane.fBm<-setProcess("fBm-plane",0.6)
fieldsim(plane.fBm)
sample<-plane.fBm@values

plane.fBm.2<-setProcess("fBm-plane",0.7)
setValues(plane.fBm.2,sample)



