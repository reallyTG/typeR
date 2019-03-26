library(Rraven)


### Name: run_raven
### Title: Open sound files in 'Raven' sound analysis software
### Aliases: run_raven

### ** Examples

## Not run: 
##D # First set temporary folder
##D setwd(tempdir())
##D 
##D # save sound files
##D library(warbleR) 
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4"))
##D writeWave(Phae.long1, "Phae.long1.wav", extensible = FALSE)
##D writeWave(Phae.long2, "Phae.long2.wav", extensible = FALSE)
##D 
##D # here replace with the path where 'Raven' is install in your computer
##D raven.path <- "PATH_TO_RAVEN_DIRECTORY_HERE" 
##D 
##D # run function 
##D run_raven(raven.path = raven.path, sound.files = c("Phae.long1.wav", "Phae.long2.wav"),
##D  at.the.time = 2, import = T, name.from.file = T, ext.case = "upper", 
##D  all.data = TRUE, path = tempdir())  
##D  
##D #getting all the data
##D rav.dat<-run_raven(all.data = TRUE, raven.path = raven.path)
##D # View(rav.dat)
##D 
##D writeWave(Phae.long3, "Phae.long3.wav", extensible = FALSE)
##D writeWave(Phae.long4, "Phae.long4.wav", extensible = FALSE)
##D 
##D # run function on all the wav files in the working directory 3 at the time
##D run_raven(raven.path = raven.path, sound.files = list.files(pattern = "\\.wav$", 
##D ignore.case = TRUE, path = tempdir()), at.the.time = 3, import = FALSE, 
##D path = tempdir())
##D   
## End(Not run)




