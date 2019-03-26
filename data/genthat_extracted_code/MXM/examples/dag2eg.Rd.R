library(MXM)


### Name: Transformation of a DAG into an essential graph
### Title: Transforms a DAG into an essential graph
### Aliases: dag2eg
### Keywords: Essential graph equivalence class

### ** Examples

# simulate a dataset with continuous data
# simulate a dataset with continuous data
y = rdag(1000, 10, 0.3)
tru = y$G 
eg = dag2eg(tru)
par( mfrow = c(1, 2) )
plotnetwork(tru)
plotnetwork(eg)



