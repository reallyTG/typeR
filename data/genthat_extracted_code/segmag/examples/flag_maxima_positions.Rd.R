library(segmag)


### Name: flag_maxima_positions
### Title: Detect local maxima/minima of a numeric vector
### Aliases: flag_maxima_positions flag_minima_positions

### ** Examples

var <- c(1,2,3,3,2,1,4,5,6,7,5,4,3)

## Using the Maxima functions
flag_maxima_positions(var)

# values of maxima
var[flag_maxima_positions(var)]

# indices of maxima
which(flag_maxima_positions(var))


## Using the Minima functions
flag_minima_positions(var)

# values of maxima
var[flag_minima_positions(var)]

# indices of maxima
which(flag_minima_positions(var))



