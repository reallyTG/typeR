library(rcompanion)


### Name: cldList
### Title: Compact letter display for lists of comparisons
### Aliases: cldList

### ** Examples

data(PoohPiglet)
PoohPiglet$Speaker = factor(PoohPiglet$Speaker,
                            levels=c("Pooh", "Tigger", "Piglet"))
library(FSA)
DT = dunnTest(Likert ~ Speaker,
              data=PoohPiglet,
              method="bh")
DT = DT$res
DT
cldList(P.adj ~ Comparison,
        data      = DT,
        threshold = 0.05)




