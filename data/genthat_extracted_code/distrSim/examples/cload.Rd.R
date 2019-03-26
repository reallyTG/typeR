library(distrSim)


### Name: cload
### Title: cload
### Aliases: cload
### Keywords: methods file

### ** Examples

# see Dataclass and Evaluation for examples
## The function is currently defined as
function(filename){
  eval.parent(parse(text=paste("load(\"",filename,".comment\")", sep = "")))
  }



