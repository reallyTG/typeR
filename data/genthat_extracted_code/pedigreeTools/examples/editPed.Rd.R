library(pedigreeTools)


### Name: editPed
### Title: Edits a disordered or incomplete pedigree.
### Aliases: editPed

### ** Examples

pede <- data.frame(sire=as.character(c(NA,NA,NA,NA,NA,1,3,5,6,4,8,1,10,8)),
                   dam=as.character(c(NA,NA,NA,NA,NA,2,2,NA,7,7,NA,9,9,13)),
                   label=as.character(1:14))
pede <- pede[sample(replace=FALSE, 1:14),]
pede <- editPed(sire=pede$sire, dam=pede$dam, label=pede$label)
ped <- with(pede, pedigree(label=label, sire=sire, dam=dam))



