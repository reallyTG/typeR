library(Rlab)


### Name: stats
### Title: Calculate summary statistics
### Aliases: stats
### Keywords: univar

### ** Examples

#Statistics for 8 normal random samples: 
zork<- matrix( rnorm(200), ncol=8) 
stats(zork) 

zork<- rnorm( 200)
id<- sample( 1:8, 200, replace=TRUE)
stats( zork, by=id)



