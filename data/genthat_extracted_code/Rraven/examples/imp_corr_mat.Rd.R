library(Rraven)


### Name: imp_corr_mat
### Title: Import 'Raven' batch correlator output
### Aliases: imp_corr_mat

### ** Examples

## Not run: 
##D  
##D # Load data
##D library(warbleR)
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
##D 
##D writeWave(Phae.long1, "Phae.long1.wav", extensible = FALSE) #save sound files 
##D writeWave(Phae.long2, "Phae.long2.wav", extensible = FALSE)
##D writeWave(Phae.long3, "Phae.long3.wav", extensible = FALSE)
##D writeWave(Phae.long4, "Phae.long4.wav", extensible = FALSE)
##D 
##D #create new folder to put cuts
##D dir.create("cuts")
##D 
##D # cut files
##D cut_sels(X = selec.table, mar = 0.05, path = tempdir(), dest.path = file.path(tempdir(), "cuts"))
##D 
##D #Now run 'Raven' batch correlator un the cuts and save the output in the same folder
##D 
##D # Import output (change the name of the file if you used a different one)
##D xcorr.rav <- imp_corr_mat(file = "BatchCorrOutput.txt", 
##D path = file.path(tempdir(), "cuts"))
##D 
##D # check results
##D   
##D ## correlation matrix
##D xcorr.rav[[1]]
##D 
##D ## time lag matrix
##D xcorr.rav[[2]]
## End(Not run)




