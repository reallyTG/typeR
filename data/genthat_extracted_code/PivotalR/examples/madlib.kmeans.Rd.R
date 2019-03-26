library(PivotalR)


### Name: madlib.kmeans
### Title: Wrapper for MADlib's Kmeans clustering function
### Aliases: madlib.kmeans
### Keywords: madlib

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D dat <- db.data.frame("__madlib_km_sample__", conn.id = cid, verbose = FALSE)
##D cent <- db.data.frame("__madlib_km_centroids__", conn.id = cid, verbose = FALSE)
##D 
##D seed.matrix <- matrix(
##D   c(14.23,1.71,2.43,15.6,127,2.8,3.06,0.28,2.29,5.64,1.04,3.92,1065,
##D     13.2,1.78,2.14,11.2,1,2.65,2.76,0.26,1.28,4.38,1.05,3.49,1050),
##D   byrow=T, nrow=2)
##D 
##D fit <- madlib.kmeans(dat, 2, key= 'key')
##D fit
##D 
##D ## kmeans++ seeding method
##D fit <- madlib.kmeans(dat, 2, key= 'key', kmeanspp=TRUE)
##D fit # display the result
##D 
##D ## Initial centroid table
##D fit <- madlib.kmeans(dat, centers= cent, key= 'key')
##D fit
##D 
##D ## Initial centroid matrix
##D fit <- madlib.kmeans(dat, centers= seed.matrix, key= 'key')
##D fit
##D 
##D db.disconnect(cid)
## End(Not run)



