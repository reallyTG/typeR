library(diverse)


### Name: disparity
### Title: A procedure to compute the sum and average of disparities
### Aliases: disparity

### ** Examples

data(pantheon)
disparity(data= pantheon)
disparity(data = pantheon, method='Canberra')
#For scientific publications
#Same disparities, since all countries authored all entities
disparity(scidat)
disparity(data= scidat, method='cosine')
#Creating differences by measuring Revealed Compartive Advantages
disparity(values(scidat, norm='rca', filter=1))
#Activity Index for scientometrics
disparity(values(scidat, norm='ai', filter=0), method='cosine')
#Using binarization of values and a binary metric for dissimilarities.
disparity(values(scidat, norm='ai', filter=0, binary=TRUE), method='jaccard')



