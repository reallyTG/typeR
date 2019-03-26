library(BSDA)


### Name: Tensile
### Title: Tensile strength of plastic bags from two production runs
### Aliases: Tensile
### Keywords: datasets

### ** Examples


boxplot(tensile ~ run, data = Tensile, 
        col = c("purple", "cyan"))
t.test(tensile ~ run, data = Tensile)




