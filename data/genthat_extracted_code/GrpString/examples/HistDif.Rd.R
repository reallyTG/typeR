library(GrpString)


### Name: HistDif
### Title: Customizes the positions of legend and p value in a histogram
### Aliases: HistDif
### Keywords: programming

### ** Examples

# simple example, use the vectors of ld difference values obtained from StrDif
strs1.vec <- c("ABCDdefABCDa", "def123DC", "123aABCD", "ACD13", "AC1ABC", "3123fe")
strs2.vec <- c("xYZdkfAxDa", "ef1563xy", "BC9Dzy35X", "AkeC1fxz", "65CyAdC", "Dfy3f69k")
ld.dif.vec <- StrDif(strs1.vec, strs2.vec, num_perm = 500, p.x = 0.025)
HistDif(dif.vec = ld.dif.vec, obsDif = 0.00751, pvalue = 0.35600, 
        o.x = 0.025, p.x = 0.040, p.y = 75)



