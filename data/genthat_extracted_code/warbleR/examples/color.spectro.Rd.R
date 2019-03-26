library(warbleR)


### Name: color.spectro
### Title: Highlight spectrogram regions
### Aliases: color.spectro

### ** Examples

## Not run: 
##D  
##D # First set empty folder
##D # setwd(tempdir())
##D data(list = c("Phae.long1", "selec.table"))
##D writeWave(Phae.long1, "Phae.long1.wav") #save sound files 
##D 
##D  # subset selection table
##D  st <- selec.table[selec.table$sound.files == "Phae.long1.wav",]
##D  
##D  # read wave file as an R object
##D  sgnl <- tuneR::readWave(as.character(st$sound.files[1]))
##D  
##D  # create color column
##D  st$colors <- c("red2", "blue", "green")
##D  
##D  # highlight selections
##D  color.spectro(wave = sgnl, wl = 300, ovlp = 90, flim = c(1, 8.6), collevels = seq(-90, 0, 5), 
##D  dB = "B", X = st, col.clm = "colors", base.col = "skyblue",  t.mar = 0.07, f.mar = 0.1, 
##D  interactive = NULL)
##D  
##D  # interactive (selected manually: you have to select them by clicking on the spectrogram)
##D  color.spectro(wave = sgnl, wl = 300, ovlp = 90, flim = c(1, 8.6), collevels = seq(-90, 0, 5),
##D   dB = "B", col.clm = "colors", t.mar = 0.07, f.mar = 1, interactive = 2)
## End(Not run)




