library(LeLogicielR)


### Name: diagcroix
### Title: Diagramme en croix
### Aliases: diagcroix

### ** Examples

data(NUTRIAGE)
attach(NUTRIAGE)
situation <- as.factor(situation)
levels(situation) <- c("seul","couple","famille","autre")
diagcroix(situation,col=c("orange","darkgreen","black","tan"))
detach(NUTRIAGE)



