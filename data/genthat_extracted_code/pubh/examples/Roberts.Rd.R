library(pubh)


### Name: Roberts
### Title: Extracorporeal membrane oxygenation in neonates.
### Aliases: Roberts
### Keywords: datasets

### ** Examples

barchart(with(Roberts, table(EMO, Survived)), horizontal = FALSE, stack = FALSE,
         xlab = "EMO treatment", ylab = "Number of subjects",
         auto.key = list(title = "Survived", space = "right", cex = 0.8))



