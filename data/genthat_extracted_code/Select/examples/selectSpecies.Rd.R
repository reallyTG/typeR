library(Select)


### Name: selectSpecies
### Title: Select species based on traits
### Aliases: selectSpecies

### ** Examples

### 1 trait constraint with maximum entropy
Spp <- 5 #S = number of species
trait <- as.matrix(data.frame(trait=c(1:Spp)))
rownames(trait) <- c(letters[1:nrow(trait)])
result1 <- selectSpecies(t2c=trait, constraints=c(trait=3.5), t2d=trait, obj="H", capd=FALSE)
### compare result1 with virtually identical maxent output from FD package
#FD::maxent(constr=c(3.5),states=trait)$prob
### 1 trait constraint with maximum functional diversity
result2 <- selectSpecies(t2c=trait, constraints=c(trait=3.5), t2d=trait, obj="Q", capd=FALSE)
### 1 trait constraint with maximum functional diversity and entropy
result3 <- selectSpecies(t2c=trait, constraints=c(trait=3.5), t2d=trait, obj="QH", capd=FALSE)

### Plot results
plotProbs(result1,trait, xlab="Trait")
plotProbs(result2,trait, xlab="Trait")
plotProbs(result3,trait, xlab="Trait")

### 1 trait and no trait constraint
result4 <- selectSpecies(t2d=trait, obj="QH", capd=FALSE)
plotProbs(result4,trait, xlab="Trait")

##### 2 traits: Constrain trait X at X=3, diversify trait Y
traitX <- matrix(c(rep(1,4),rep(2,4),rep(3,4),rep(4,4)))
traitY <- matrix(c(rep(c(1,2,3,4),4)))
rownames(traitX) <- c(letters[1:16]); colnames(traitX) <- c("traitX")
rownames(traitY) <- c(letters[1:16]); colnames(traitY) <- c("traitY")

result5 <- selectSpecies(t2c=traitX,constraints=c(traitX=3),t2d=traitY,obj="Q",capd=FALSE)
result6 <- selectSpecies(t2c=traitX,constraints=c(traitX=3),t2d=traitY,obj="QH",capd=TRUE)

trait.matrix <- cbind(traitX, traitY)
plotProbs(result5,trait.matrix)
plotProbs(result6,trait.matrix)

##### 3 traits: Constrain trait Z to value 2.5, diversify trait X and Y
traitZ <- as.matrix(data.frame(c(1,3,2,2,3,1,2,3,1,2,1,3,2,3,2,2)))
rownames(traitZ) <- c(letters[1:16]); colnames(traitZ) <- c("traitZ")
result7 <- selectSpecies(t2c=traitZ,constraints=c(traitZ=2.5),t2d=trait.matrix, capd=TRUE, obj="QH")
plotProbs(result7,trait.matrix)




