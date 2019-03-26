library(fAssets)


### Name: assets-distance
### Title: Distance Measures
### Aliases: assetsDist corDist kendallDist spearmanDist mutinfoDist
###   euclideanDist maximumDist manhattanDist canberraDist binaryDist
###   minkowskiDist braycurtisDist mahalanobisDist jaccardDist sorensenDist
### Keywords: stats

### ** Examples
  
## LPP -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC[, 1:6]
   head(LPP)

## Returns correlation distance measure
   corDist(LPP)  
   
## Returns kendalls correlation distance measure  
   kendallDist(LPP) 
   
## Returns spearmans correlation distance measure
   spearmanDist(LPP)          

## Return mutual information distance measure
   mutinfoDist(LPP)             

## Return Euclidean distance measure
   euclideanDist(LPP)
   
## Return maximum distance measure
   maximumDist(LPP)              

## Return Manhattan distance measure  
   manhattanDist(LPP)            

## Return Canberra distance measure
   canberraDist(LPP)             

## Return binary distance measure
   binaryDist(LPP)               

## Return Minkowsky distance measure
   minkowskiDist(LPP)            

## Return Bray Curtis distance measure
   braycurtisDist(LPP)           
   
## Return Mahalanobis distance measure
   # mahalanobisDist(LPP)          
   
## Return Jaccard distance mesaure
   jaccardDist(LPP)         
   
## Return Sorensen distance measure
   sorensenDist(LPP)               



