library(Select)


### Name: plotProbs
### Title: Plots results from the selectSpecies function
### Aliases: plotProbs

### ** Examples

### 1 trait constraint with maximum functional diversity and entropy
Spp <- 5 #S = number of species
trait <- as.matrix(data.frame(trait=c(1:Spp)))
rownames(trait) <- c(letters[1:nrow(trait)])
result1 <- selectSpecies(t2c=trait, constraints=c(3.5), t2d=trait, obj="QH", capd=FALSE)
plotProbs(result1,trait, xlab="Trait")

##### 2 traits: Constrain trait X to value 2.5, diversify trait Y
traitX <- matrix(c(rep(1,3),rep(2,3),rep(3,3)))
traitY <- matrix(c(rep(c(1,2,3),3)))
rownames(traitX) <- c(letters[1:9]); colnames(traitX) <- c("traitX")
rownames(traitY) <- c(letters[1:9]); colnames(traitY) <- c("traitY")
result2 <- selectSpecies(t2c=traitX,constraints=c(traitX=2.5),t2d=traitY,capd=TRUE,obj="QH")
plotProbs(result2,traits = cbind(traitX, traitY))



