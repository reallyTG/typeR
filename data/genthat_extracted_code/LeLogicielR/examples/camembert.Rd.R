library(LeLogicielR)


### Name: camembert
### Title: Diagramme circulaire
### Aliases: camembert

### ** Examples

data(NUTRIAGE)
attach(NUTRIAGE)
matgras <- as.factor(matgras)
levels(matgras) <- c("beurre","margarine","arachide","tournesol","olive","Isio4","colza","canard")
require("RColorBrewer")
col <- brewer.pal(8,"Pastel2")
camembert(matgras,col)
detach(NUTRIAGE)



