library(OasisR)


### Name: ACL
### Title: A function to compute Absolute Clustering Index (ACL)
### Aliases: ACL

### ** Examples

x <- segdata@data[ ,1:2]
contiguity <- contig(segdata)
diag(contiguity) <- 1
ar<-area(segdata)
dist <- distance(segdata)
diag(dist)<-sqrt(ar) * 0.6
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

ACL(x, c = contiguity) 

ACL(x, spatobj = segdata)

ACL(x, spatmat = 'd', folder = foldername, shape = shapename) 
 
ACL(x,  spatmat = 'd', diagval = 'a', spatobj = segdata)

ACL(x, d = dist, spatmat = 'd')




