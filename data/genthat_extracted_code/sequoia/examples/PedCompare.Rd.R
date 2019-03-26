library(sequoia)


### Name: PedCompare
### Title: Compare two Pedigrees
### Aliases: PedCompare

### ** Examples

## Not run: 
##D data(Ped_HSg5, SimGeno_example, LH_HSg5, package="sequoia")
##D SeqOUT <- sequoia(GenoM = SimGeno_example, LifeHistData = LH_HSg5)
##D compare <- PedCompare(Ped1=Ped_HSg5, Ped2=SeqOUT$Pedigree)
##D compare$Counts   # 2 mismatches, due to simulated genotyping errors
##D head(compare$MergedPed)
##D 
##D PedM <- compare$MergedPed
##D # find mismatching mothers:
##D with(PedM, PedM[which(dam.1!=dam.2 & dam.1!=dam.r),])
##D 
##D # find mothers in Ped1 which are genotyped but not assigned in Ped2:
##D with(PedM, PedM[which(is.na(dam.2) & !is.na(dam.1) &
##D                        !is.na(id) & dam.1 %in% id),])
## End(Not run)



