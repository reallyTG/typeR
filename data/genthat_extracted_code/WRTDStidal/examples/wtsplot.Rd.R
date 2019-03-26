library(WRTDStidal)


### Name: wtsplot
### Title: Plot the weights for an observation
### Aliases: wtsplot wtsplot.default wtsplot.tidal wtsplot.tidalmean

### ** Examples


## load a fitted tidal object
data(tidfit)

## plot using defaults, 
wtsplot(tidfit)

## change the defaults
wtsplot(tidfit, ref = '2000-01-01', wins = list(0.5, 15, Inf), 
 dt_rng = c('1990-01-01', '2010-01-01'), 
 pt_rng = c(3, 8), col_vec = c('lightgreen', 'lightblue', 'purple'),
 alpha = 0.7)



