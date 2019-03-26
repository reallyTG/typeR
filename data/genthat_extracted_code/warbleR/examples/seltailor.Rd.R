library(warbleR)


### Name: seltailor
### Title: Interactive view of spectrograms to tailor selections
### Aliases: seltailor

### ** Examples

## Not run: 
##D #Set temporary working directory
##D # setwd(tempdir())
##D 
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
##D writeWave(Phae.long1,"Phae.long1.wav")
##D writeWave(Phae.long2,"Phae.long2.wav")
##D writeWave(Phae.long3,"Phae.long3.wav")
##D writeWave(Phae.long4,"Phae.long4.wav")
##D 
##D seltailor(X =  selec.table, flim = c(1,12), wl = 300, auto.next = TRUE)
##D 
##D # Read output .csv file
##D seltailor.df <- read.csv("seltailor_output.csv")
##D seltailor.df
##D 
##D # check this directory for .csv file after stopping function
##D getwd()
## End(Not run)



