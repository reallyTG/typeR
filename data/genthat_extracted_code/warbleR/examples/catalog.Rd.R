library(warbleR)


### Name: catalog
### Title: Create catalog of vocal signals
### Aliases: catalog

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D # save sound file examples
##D data(list = c("Phae.long1", "Phae.long2","selec.table"))
##D writeWave(Phae.long1,"Phae.long1.wav") 
##D writeWave(Phae.long2,"Phae.long2.wav")
##D  writeWave(Phae.long3,"Phae.long3.wav")
##D  writeWave(Phae.long4,"Phae.long4.wav")
##D 
##D 
##D catalog(X = selec.table, flim = c(1, 10), nrow = 4, ncol = 2, same.time.scale = T,
##D  ovlp = 90, parallel = 1, mar = 0.01, wl = 200, gr = FALSE,
##D  orientation = "v", labels = c("sound.files", "selec"), legend = 0)
##D  
##D  #different time scales and tag palette
##D catalog(X = selec.table, flim = c(1, 10), nrow = 4, ncol = 2, same.time.scale = F,
##D  ovlp = 90, parallel = 1, mar = 0.01, wl = 200, 
##D  orientation = "v",  labels = c("sound.files", "selec"), legend = 0, 
##D  tag.pal = list(terrain.colors))
##D  
##D  #adding tags and changing spectro palette
##D catalog(X = selec.table, flim = c(1, 10), nrow = 4, ncol = 2, same.time.scale = F,
##D  ovlp = 90, parallel = 1, mar = 0.01, wl = 200, pal = reverse.heat.colors,
##D  orientation = "v",  labels = c("sound.files", "selec"), legend = 1, 
##D  tag.pal = list(terrain.colors), tags = "sound.files")
##D 
##D  #create a bigger selection table
##D  X <- rbind(selec.table, selec.table, selec.table, selec.table)
##D  X <- rbind(X, X)
##D  
##D  #create some simulated labels
##D  X$songtype <- sample(letters[13:15], nrow(X), replace = T)
##D  X$indiv <- sample(letters[1:12], nrow(X), replace = T)
##D 
##D # 12 columns in 5 rows, 2 tags
##D catalog(X = X, flim = c(1, 10), nrow = 5, ncol = 12, same.time.scale = F,
##D  ovlp = 90, parallel = 1, mar = 0.01, wl = 200, 
##D  orientation = "v",  labels = c("sound.files", "selec"), legend = 3, 
##D  collevels = seq(-65, 0, 5), tag.pal = list(terrain.colors), tags = c("songtype", "indiv"))
##D 
##D # with legend
##D catalog(X = X, flim = c(1, 10), nrow = 5, ncol = 12, same.time.scale = F,
##D  ovlp = 90, parallel = 1, mar = 0.01, wl = 200, gr = FALSE,
##D  orientation = "v",  labels = c("sound.files", "selec"), legend = 3, 
##D  width = 20, collevels = seq(-65, 0, 5), tag.pal = list(terrain.colors),
##D   tags = c("songtype", "indiv"))
##D   
##D   # horizontal orientation
##D catalog(X = X, flim = c(1, 10), nrow = 5, ncol = 12, same.time.scale = F,
##D  ovlp = 90, parallel = 1, mar = 0.01, wl = 200, gr = FALSE,
##D  orientation = "h",  labels = c("sound.files", "selec"), legend = 3, 
##D  width = 20, collevels = seq(-65, 0, 5), tag.pal = list(terrain.colors),
##D   tags = c("songtype", "indiv"))
##D check this floder
##D getwd()
## End(Not run)



