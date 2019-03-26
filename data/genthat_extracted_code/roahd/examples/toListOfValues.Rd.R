library(roahd)


### Name: toListOfValues
### Title: Manipulation of 'mfData' list of values
### Aliases: toListOfValues

### ** Examples


grid = seq( 0, 1, length.out = 5 )

D_1 = matrix( 1 : 5, nrow = 10, ncol = 5, byrow = TRUE )
D_2 = 2 * D_1
D_3 = 3 * D_1

mfD = mfData( grid, list( D_1, D_2, D_3 ) )
mfD

toListOfValues( mfD )




