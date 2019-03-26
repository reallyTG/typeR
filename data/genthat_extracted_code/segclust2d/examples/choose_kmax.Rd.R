library(segclust2d)


### Name: choose_kmax
### Title: Finding best segmentation with a different treshold S
### Aliases: choose_kmax

### ** Examples


## Not run: 
##D res.seg <- segmentation(df, coord.names = c("x","y"), Kmax = 30, lmin = 10)
##D #find the optimal number of segment according to Lavielle's criterium with a different threshold.
##D choose_kmax(res.seg, S = 0.60) 
## End(Not run)



