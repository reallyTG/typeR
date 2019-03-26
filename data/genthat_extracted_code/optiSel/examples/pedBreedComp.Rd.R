library(optiSel)


### Name: pedBreedComp
### Title: Calculates the Pedigree Based Breed Composition of Individuals
### Aliases: pedBreedComp

### ** Examples

data(ExamplePed)
Pedig    <- prePed(ExamplePed, thisBreed="Hinterwaelder", lastNative=1970)
cont     <- pedBreedComp(Pedig, thisBreed="Hinterwaelder")
cont[1000:1010,2:5]

contByYear <- conttac(cont, Pedig$Born, use=Pedig$Breed=="Hinterwaelder", mincont=0.04, long=FALSE)
round(contByYear,2)

barplot(contByYear,ylim=c(0,1), col=1:10, ylab="genetic contribution",
        legend=TRUE, args.legend=list(x="bottomleft",cex=0.6))



