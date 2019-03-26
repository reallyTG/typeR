library(sysfonts)


### Name: font_add_google
### Title: Load Google Fonts into 'sysfonts'
### Aliases: font_add_google font.add.google

### ** Examples

## Not run: 
##D font_add_google("Alegreya Sans", "aleg")
##D 
##D if(require(showtext))
##D {
##D     wd = setwd(tempdir())
##D     pdf("google-fonts-ex.pdf")
##D     showtext_begin()
##D     
##D     par(family = "aleg")
##D     plot(0:5,0:5, type="n")
##D     text(1:4, 1:4, "Alegreya Sans", font=1:4, cex = 2)
##D     
##D     showtext_end()
##D     dev.off()
##D     setwd(wd)
##D }
##D 
## End(Not run)



