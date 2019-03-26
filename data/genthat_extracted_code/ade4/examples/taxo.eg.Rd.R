library(ade4)


### Name: taxo.eg
### Title: Examples of taxonomy
### Aliases: taxo.eg
### Keywords: datasets

### ** Examples

data(taxo.eg)
taxo.eg[[1]]
as.taxo(taxo.eg[[1]])
class(taxo.eg[[1]])
class(as.taxo(taxo.eg[[1]]))

tax.phy <- taxo2phylog(as.taxo(taxo.eg[[1]]),  add.tools = TRUE)
plot(tax.phy,clabel.l=1)

par(mfrow = c(1,2))
table.phylog(tax.phy$Bindica,tax.phy)
table.phylog(tax.phy$Bscores,tax.phy)
par(mfrow = c(1,1))

radial.phylog(taxo2phylog(as.taxo(taxo.eg[[2]])))



