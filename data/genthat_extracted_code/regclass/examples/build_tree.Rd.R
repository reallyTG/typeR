library(regclass)


### Name: build_tree
### Title: Exploratory building of partition models
### Aliases: build.tree build_tree

### ** Examples

  data(JUNK)
  build_tree(Junk~.,data=JUNK,seed=1337)
  data(CENSUS)
  build_tree(ResponseRate~.,data=CENSUS,seed=2017,mincp=0.001)
  data(OFFENSE)
  build_tree(Win~.,data=OFFENSE[1:200,],seed=2029,holdout=OFFENSE[201:352,])



