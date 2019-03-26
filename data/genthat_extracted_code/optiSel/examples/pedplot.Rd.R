library(optiSel)


### Name: pedplot
### Title: Plots a Pedigree
### Aliases: pedplot

### ** Examples

data(PedigWithErrors)

sPed  <- subPed(PedigWithErrors, keep="276000810087543", prevGen=3, succGen=2)
pedplot(sPed, mar=c(2,4,2,4), label=c("Indiv", "Born", "Breed"), cex=0.4)



