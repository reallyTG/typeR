library(MotilityLab)


### Name: motilityLab-package
### Title: MotilityLab: Quantitative Motion Analysis
### Aliases: motilityLab-package motilityLab
### Keywords: cluster spatial

### ** Examples

## track-based speed comparison
boxplot(sapply( Neutrophils, straightness ), sapply( BCells, straightness ))

## step-based turning angle comparison
boxplot(sapply(subtracks(Neutrophils, 2), overallAngle), 
  sapply(subtracks(BCells, 2), overallAngle))

## mean square displacement plot; a step-based displacement analysis for all step lengths
plot(aggregate(TCells, squareDisplacement)[,"value"]) 

## 'staggered' analysis of displacement over whole track. Reveals that this track
## slows down near its beginning and near its end. 
filled.contour(applyStaggered(TCells[[4]], displacement, matrix=TRUE))

## a simple hierarchical clustering based on 2D asphericity

## tag track IDs so we can identify them later
names(TCells) <- paste0("T",names(TCells))
names(BCells) <- paste0("B",names(BCells))
names(Neutrophils) <- paste0("N",names(Neutrophils))

## project all tracks down to 2D
cells <-  projectDimensions(c(TCells,BCells,Neutrophils), c("x","y"))

## compute asphericity
asph <- lapply(cells, asphericity)

## plot clustering
plot(hclust(dist(asph)))



