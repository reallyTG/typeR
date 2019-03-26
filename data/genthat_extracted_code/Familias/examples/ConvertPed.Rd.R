library(Familias)


### Name: ConvertPed
### Title: Converts pedigree data frame to kinship2 pedigree object
### Aliases: ConvertPed

### ** Examples

persons <- c("AF","mother", "daughter")
ped1=swapSex(nuclearPed(1),3)
locus1=marker(ped1,1,c(1,1),2,c(2,2),3,c(1,2))
ped1=addMarker(ped1,locus1)
# A plot function such as the following can now be used: 
# plot(ped1,marker=1,id.labels=persons,title="ped1") 
ped1=as.data.frame(ped1) 
ConvertPed(ped1,persons)



