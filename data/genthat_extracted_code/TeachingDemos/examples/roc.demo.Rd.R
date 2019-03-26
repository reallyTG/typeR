library(TeachingDemos)


### Name: roc.demo
### Title: Demonstrate ROC curves by interactively building one
### Aliases: roc.demo
### Keywords: dynamic classif

### ** Examples


if(interactive()){
roc.demo()
with(CO2,
  roc.demo(uptake[Type=='Mississippi'],
           uptake[Type=='Quebec']       )
)
}



