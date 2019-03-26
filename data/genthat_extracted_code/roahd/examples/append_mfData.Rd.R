library(roahd)


### Name: append_mfData
### Title: Append two compatible multivariate functional datasets
### Aliases: append_mfData

### ** Examples

# Creating two simple bivariate datasets

grid = seq(0, 2 * pi, length.out = 100)

values11 = matrix( c(sin(grid),
                     sin(2 * grid)), nrow = 2, ncol = length(grid),
                   byrow=TRUE)
values12 = matrix( c(sin(3 * grid),
                     sin(4 * grid)), nrow = 2, ncol = length(grid),
                   byrow=TRUE)
values21 = matrix( c(cos(grid),
                     cos(2 * grid)), nrow = 2, ncol = length(grid),
                   byrow=TRUE)
values22 = matrix( c(cos(3 * grid),
                     cos(4 * grid)), nrow = 2, ncol = length(grid),
                   byrow=TRUE)

mfD1 = mfData( grid, list(values11, values12) )
mfD2 = mfData( grid, list(values21, values22) )

# Appending them to a unique dataset
append_mfData(mfD1, mfD2)




