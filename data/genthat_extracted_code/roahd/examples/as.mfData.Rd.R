library(roahd)


### Name: as.mfData
### Title: Converting object to 'mfData' class
### Aliases: as.mfData as.mfData.list

### ** Examples


grid = seq( 0, 1, length.out = 100 )

fD_1 = fData( grid, sin( 2 * pi * grid ) )
fD_2 = fData( grid, cos( 2 * pi * grid ) )

plot( as.mfData( list( fD_1, fD_2 ) ) )




