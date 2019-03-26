library(SDraw)


### Name: sss.point
### Title: Draw a Simple Systematic Sample (SSS) from a point resource or
###   finite population frame.
### Aliases: sss.point
### Keywords: design survey

### ** Examples


# Draw systematic sample across range of population
WA.samp <- sss.point( WA.cities[order(WA.cities$POP_2010),], 100 )   
plot( WA.cities )
points( WA.samp, col="red", pch=16 )

# Draw systematic sample from data frame
df <- data.frame( a=1:100, b=runif(100) )
samp <- sss.point( df, 5 )   

# Equivalent to simple random sample: randomly sort frame.
samp <- sss.point( df[order(df$b),], 5 )




