library(roahd)


### Name: append_fData
### Title: Append two compatible univariate functional datasets
### Aliases: append_fData

### ** Examples

# Creating two simple univariate datasets

grid = seq(0, 2 * pi, length.out = 100)

values1 = matrix( c(sin(grid),
                    sin(2 * grid)), nrow = 2, ncol = length(grid),
                   byrow=TRUE)

values2 = matrix( c(cos(grid),
                    cos(2 * grid)), nrow = 2, ncol = length(grid),
                   byrow=TRUE)

fD1 = fData( grid, values1 )
fD2 = fData( grid, values2 )

# Appending them to a unique dataset
append_fData(fD1, fD2)




