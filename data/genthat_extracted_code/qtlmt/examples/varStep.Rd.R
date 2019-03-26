library(qtlmt)


### Name: varStep
### Title: Variable selection
### Aliases: varAdd1 varDrop1 varStep

### ** Examples

data(etrait)
varAdd1(traits, group=mdat[,42], vin=10, scope=1:ncol(traits))
varStep(traits, group=mdat[,42], k=12, scope=1:ncol(traits),
   direction="back")



