library(pairwise)


### Name: gif
### Title: Graphical Item Fit Plots
### Aliases: gif

### ** Examples

########
data(bfiN)
pers_obj <- pers(pair(bfiN))
#### plot empirical category probabilities
gif(pers_obj = pers_obj, itemnumber = 1 )
gif(pers_obj = pers_obj, itemnumber = 1 , integ=8) # integration over 8 points
gif(pers_obj = pers_obj, itemnumber = 1 , integ=8, kat=1) # only for category number 1



