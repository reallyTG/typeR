library(optiSel)


### Name: subPed
### Title: Creates a Subset of a Large Pedigree
### Aliases: subPed

### ** Examples


data(PedigWithErrors)

sPed <- subPed(PedigWithErrors, keep="276000891974272", prevGen=3, succGen=2)
sPed

label <- c("Indiv", "Born", "Breed")
pedplot(sPed, mar=c(2,4,2,4), label=label, cex=0.7)




