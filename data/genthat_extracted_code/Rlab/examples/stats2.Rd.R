library(Rlab)


### Name: stats2
### Title: Calculate summary statistics
### Aliases: stats2
### Keywords: univar

### ** Examples

#Statistics for 8 normal random samples: 
zork<- matrix( rnorm(200), ncol=8) 
stats2(zork) 

zork<- rnorm( 200)
id<- sample( 1:8, 200, replace=TRUE)
stats2( zork, by=id)



