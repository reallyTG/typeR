library(Rraven)


### Name: raven_batch_detec
### Title: Run 'Raven' batch detector
### Aliases: raven_batch_detec

### ** Examples

## Not run: 
##D 
##D # here replace with the path where 'Raven' is install in your computer
##D raven.path <- "PATH_TO_RAVEN_DIRECTORY_HERE" 
##D 
##D # Run detector on raven example sound files
##D 
##D # single sound file using 'Amplitude Detector' 
##D detec.res <- raven_batch_detec(raven.path = raven.path, 
##D sound.files = "BlackCappedVireo.aif", path = file.path(raven.path, "Examples"), 
##D detector.type = "Amplitude Detector")
##D 
##D # on raven examples  2 files
##D detec.res <- raven_batch_detec(raven.path = raven.path, 
##D sound.files = c("BlackCappedVireo.aif", "CanyonWren.wav"), 
##D path = file.path(raven.path, "Examples"), detector.type = "Amplitude Detector")
##D 
##D # using 'Band Limited Energy Detector' 
##D detec.res <- raven_batch_detec(raven.path = raven.path, 
##D sound.files = c("BlackCappedVireo.aif", "CanyonWren.wav"), 
##D path = file.path(raven.path, "Examples"), detector = "Band Limited Energy Detector")
## End(Not run)




