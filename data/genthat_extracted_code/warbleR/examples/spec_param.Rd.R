library(warbleR)


### Name: spec_param
### Title: Plot a mosaic of spectrograms with varying display parameters
### Aliases: spec_param

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D # save sound file examples
##D data(list = c("Phae.long1", "selec.table"))
##D writeWave(Phae.long1,"Phae.long1.wav") 
##D 
##D # variable collevels
##D spec_param(X = selec.table, wl = 164, ovlp = c(90), wn = c("flattop"), 
##D length.out = 16, nrow = 4, ncol = 4, width = 20, height = 11.3, rm.axes = TRUE, 
##D cex = 1, box = F, collev.min = c(-20, -150))
##D 
##D # variable overlap and wn
##D spec_param(X = selec.table, wl = 164, ovlp = c(50, 90), 
##D wn = c("hanning", "hamming", "rectangle", "bartlett", "blackman", "flattop"),
##D length.out = 7, nrow = 6, ncol = 7, width = 20, height = 11.3, rm.axes = TRUE, 
##D cex = 1, box = F)
##D 
##D # variable wl and wn
##D spec_param(X = selec.table, wl = c(100, 1000), ovlp = c(50, 90), wn = "all", 
##D length.out = 5, nrow = 10, ncol = 14, width = 20, height = 11.3, rm.axes = TRUE, 
##D cex = 0.7)
##D 
##D # variable wl, collev.min and wn 
##D spec_param(X = selec.table, wl = c(100, 1000), ovlp = 90, 
##D wn = c("hanning", "hamming", "rectangle"), collev.min = c(-110, -25), 
##D length.out = 3, nrow = 10, ncol = 14, width = 20, height = 11.3, rm.axes = TRUE,
##D  cex = 0.7)
##D  
##D  # variable wl, wn and pal
##D  spec_param(X = selec.table, wl = c(100, 1000), ovlp = 90, 
##D  wn = c("hanning", "hamming", "rectangle"), 
##D  pal = c("reverse.gray.colors.2", "reverse.topo.colors", 
##D  "reverse.terrain.colors", "reverse.cm.colors"), 
##D  length.out = 4, nrow = 5, ncol = 10, width = 20, height = 11.3,
##D   rm.axes = TRUE, cex = 0.7, lab.mar = 2)
##D   
##D   # wl, wn and pal
##D   spec_param(X = selec.table, wl = c(100, 1000), ovlp = 90,
##D    wn = c("hanning", "hamming", "rectangle"), 
##D   pal = c("reverse.gray.colors.2", "reverse.topo.colors", 
##D   "reverse.terrain.colors", "reverse.cm.colors"), 
##D   length.out = 4, nrow = 5, ncol = 10, width = 20, height = 11.3, rm.axes = TRUE,
##D    cex = 0.7, group.tag = "wn",  spec.mar = 0.4, lab.mar = 0.8, box = FALSE, 
##D    tag.pal = list(reverse.cm.colors))
##D 
##D check this floder
##D getwd()
## End(Not run)



