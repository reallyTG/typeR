library(warbleR)


### Name: compare.methods
### Title: Assessing the performance of acoustic distance measurements
### Aliases: compare.methods

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D 
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
##D writeWave(Phae.long1,"Phae.long1.wav")
##D writeWave(Phae.long2,"Phae.long2.wav")
##D writeWave(Phae.long3,"Phae.long3.wav")
##D writeWave(Phae.long4,"Phae.long4.wav")
##D 
##D compare.methods(X = selec.table, flim = c(0, 10), bp = c(0, 10), mar = 0.1, wl = 300,
##D ovlp = 90, res = 200, n = 10, length.out = 30,
##D methods = c("XCORR", "dfDTW"), parallel = 1, it = "jpeg")
##D 
##D #remove progress bar
##D compare.methods(X = selec.table, flim = c(0, 10), bp = c(0, 10), mar = 0.1, wl = 300,
##D ovlp = 90, res = 200, n = 10, length.out = 30,
##D methods = c("XCORR", "dfDTW"), parallel = 1, it = "jpeg", pb = FALSE)
##D 
##D #check this folder!
##D getwd()
##D 
##D 
##D #compare SP and XCORR
##D #first we need to create a larger data set as the PCA that summarizes the spectral parameters
##D #needs more units (rows) that variables (columns)
##D #so I just create a new selection table repeating 3 times selec.table
##D st2 <- rbind(selec.table, selec.table, selec.table)
##D 
##D #note that the selection labels should be also changed
##D st2$selec <- 1:nrow(st2)
##D #now we can compare SP method against XCORR
##D compare.methods(X = st2, flim = c(0, 10), bp = c(0, 10), mar = 0.1, wl = 300,
##D ovlp = 90, res = 200, n = 10, length.out = 30,
##D methods = c("XCORR", "SP"), parallel = 1, it = "jpeg")
##D 
##D #compare SP method against dfDTW
##D compare.methods(X = st2, flim = c(0, 10), bp = c(0, 10), mar = 0.1, wl = 300,
##D ovlp = 90, res = 200, n = 10, length.out = 30,
##D methods = c("dfDTW", "SP"), parallel = 1, it = "jpeg")
##D 
##D #alternatively we can provide our own SP matrix
##D sp <- specan(selec.table, bp = c(0, 10))
##D 
##D #and selec just a few variables to avoid the problem of # observations vs # parameters in PCA
##D sp <- sp[, 1:7]
##D 
##D compare.methods(X = selec.table, flim = c(0, 10), sp = sp, bp = c(0, 10), mar = 0.1, wl = 300,
##D ovlp = 90, res = 200, n = 10, length.out = 30,
##D methods = c("XCORR", "SP"), parallel = 1, it = "jpeg")
##D 
##D #note that "SP" should also be included as a method in 'methods'
##D #again, all images are saved in the working directory
## End(Not run)




