library(dclone)


### Name: evalParallelArgument
### Title: Evaluates parallel argument
### Aliases: evalParallelArgument
### Keywords: misc utilities

### ** Examples

evalParallelArgument()
evalParallelArgument(NULL)
evalParallelArgument(1)
evalParallelArgument(2)
cl <- makePSOCKcluster(2)
evalParallelArgument(cl)
stopCluster(cl)
oop <- options("mc.cores"=2)
evalParallelArgument()
options(oop)



