library(FENmlm)


### Name: print.femlm.obs2remove
### Title: Print method for femlm.obs2remove objects
### Aliases: print.femlm.obs2remove

### ** Examples

base = iris
# v6: Petal.Length with only 0 values for 'setosa'
base$v6 = base$Petal.Length
base$v6[base$Species == "setosa"] = 0

(x = obs2remove(v6 ~ Species, base))
attr(x, "cluster")




