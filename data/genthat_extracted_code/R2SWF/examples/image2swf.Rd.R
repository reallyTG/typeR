library(R2SWF)


### Name: image2swf
### Title: Convert bitmap images to SWF
### Aliases: image2swf

### ** Examples

if(capabilities("png")) {
  olddir = setwd(tempdir())
  png("Rplot%03d.png")
  for(i in 1:9) plot(runif(20), ylim = c(0, 1))
  dev.off()
  output = image2swf(sprintf("Rplot%03d.png", 1:9))
  swf2html(output)
  setwd(olddir)
}




