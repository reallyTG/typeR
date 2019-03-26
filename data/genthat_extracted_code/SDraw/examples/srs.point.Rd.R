library(SDraw)


### Name: srs.point
### Title: Draw a Simple Random Sample (SRS) from a point resource or
###   finite population frame.
### Aliases: srs.point
### Keywords: design survey

### ** Examples


# Draw systematic sample across range of population
WA.samp <- srs.point( WA.cities, 100 )   
plot( WA.cities )
points( WA.samp, col="red", pch=16 )

# Draw systematic sample from data frame
df <- data.frame( a=1:100, b=runif(100) )
samp <- srs.point( df, 5 )   




