library(streambugs)


### Name: streambugs.write.sys.def
### Title: Write system definition of the streambugs ODE model
### Aliases: streambugs.write.sys.def

### ** Examples

m <- streambugs.example.model.toy()
sys.def <- streambugs.get.sys.def(y.names=m$y.names, par=m$par, inp=m$inp)
file.name <- tempfile(m$name, fileext=".dat")
streambugs.write.sys.def(sys.def, file.name)
file.show(file.name, delete.file=TRUE)




