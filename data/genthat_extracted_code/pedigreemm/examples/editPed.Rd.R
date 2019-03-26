library(pedigreemm)


### Name: editPed
### Title: Complete and Order a Pedigree
### Aliases: editPed
### Keywords: array algebra

### ** Examples

  #(1)
  pede<-data.frame(sire=as.character(c(NA,NA,NA,NA,NA,1,3,5,6,4,8,1,10,8)),
             dam= as.character(c(NA,NA,NA,NA,NA,2,2,NA,7,7,NA,9,9,13)),
             label=as.character(1:14))
   #scrambled original pedigree:
   (pede<- pede[sample(replace=FALSE, 1:14),]  )
   (pede<- editPed(sire=pede$sire, dam= pede$dam, label=pede$label)) 
   ped<- with(pede, pedigree(label=label, sire=sire, dam=dam))
#################################################################################################
   #(2) With missing labels
   pede<-data.frame(sire=as.character(c(NA,1,3,5,6,4,8,1,10,8)),
             dam= as.character(c(NA,2,2,NA,7,7,NA,9,9,13)),
             label=as.character(5:14))
   #scrambled original pedigree:
   (pede<- pede[sample(replace=FALSE, 1:10),]  )
   (pede<- editPed(sire=pede$sire, dam= pede$dam, label=pede$label)) 
   ped<- with(pede, pedigree(label=label, sire=sire, dam=dam))

#################################################################################################
   #(2) A larger pedigree
 #Useing pedCows pedigree
# str(pedCows)
# pede<-data.frame(id=pedCows@label, sire=pedCows@sire, dam=pedCows@dam)
# pede<-pede[sample(1:nrow(pede),replace=FALSE),]
# pede<- editPed(sire=pede$sire, dam=pede$dam, label=pede$id)
# ped<- with(pede, pedigree(label=label, sire=sire, dam=dam))



