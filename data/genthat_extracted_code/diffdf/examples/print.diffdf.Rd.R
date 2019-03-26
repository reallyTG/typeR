library(diffdf)


### Name: print.diffdf
### Title: Print diffdf objects
### Aliases: print.diffdf

### ** Examples

x <- subset( iris , -Species )
x[1,2] <- 5
COMPARE <- diffdf( iris, x)
print( COMPARE )
print( COMPARE , "Sepal.Length" )



