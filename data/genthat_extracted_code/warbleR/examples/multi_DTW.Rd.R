library(warbleR)


### Name: multi_DTW
### Title: A wrapper on 'dtwDist' for comparing multivariate contours
### Aliases: multi_DTW

### ** Examples

## Not run: 
##D #load data
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
##D 
##D writeWave(Phae.long1, "Phae.long1.wav") #save sound files 
##D writeWave(Phae.long2, "Phae.long2.wav")
##D writeWave(Phae.long3, "Phae.long3.wav")
##D writeWave(Phae.long4, "Phae.long4.wav")
##D 
##D # measure
##D df <- df_ts(X = selec.table, threshold = 10, img = FALSE)
##D se <- se_ts(X = selec.table, threshold = 10, img = FALSE)
##D 
##D # run function 
##D multi_DTW(df, se)
## End(Not run)




