library(optiSel)


### Name: pedInbreeding
### Title: Calculates Pedigree Based Inbreeding
### Aliases: pedInbreeding

### ** Examples

data(PedigWithErrors)
data(Phen)
keep  <- Phen$Indiv 
Pedig <- prePed(PedigWithErrors, keep=keep)
Res   <- pedInbreeding(Pedig)
mean(Res$Inbr[Res$Indiv %in% keep])
#[1] 0.01943394



