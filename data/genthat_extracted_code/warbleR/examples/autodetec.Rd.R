library(warbleR)


### Name: autodetec
### Title: Automatically detect vocalizations in sound files
### Aliases: autodetec

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D 
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4"))
##D writeWave(Phae.long1,"Phae.long1.wav")
##D writeWave(Phae.long2,"Phae.long2.wav")
##D writeWave(Phae.long3,"Phae.long3.wav")
##D writeWave(Phae.long4,"Phae.long4.wav") 
##D 
##D ad <- autodetec(threshold = 5, env = "hil", ssmooth = 300, power=1,
##D bp=c(2,9), xl = 2, picsize = 2, res = 200, flim= c(1,11), osci = TRUE,
##D wl = 300, ls = FALSE, sxrow = 2, rows = 4, mindur = 0.1, maxdur = 1, set = TRUE)
##D 
##D #run it with different settings
##D ad <- autodetec(threshold = 90, env = "abs", ssmooth = 300, power = 1, redo = TRUE,
##D bp=c(2,9), xl = 2, picsize = 2, res = 200, flim= c(1,11), osci = TRUE, 
##D wl = 300, ls = FALSE,  sxrow = 2, rows = 4, mindur=0.1, maxdur=1, set = TRUE)
##D 
##D #check this folder!!
##D getwd()
## End(Not run)




