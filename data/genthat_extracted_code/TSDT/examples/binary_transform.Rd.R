library(TSDT)


### Name: binary_transform
### Title: binary transform
### Aliases: binary_transform

### ** Examples

## Convert a variable that takes values 'A' and 'B' to 0 and 1
x <- sample( c('A','B'), size = 10, prob = c(0.5,0.5), replace = TRUE )
binary_transform( x )



