library(showtextdb)


### Name: font_install
### Title: Install Fonts to the 'showtextdb' Package
### Aliases: font_install font_installed

### ** Examples

## Not run: 
##D ## Install Source Han Serif Simplified Chinese
##D font_install(source_han_serif())
##D 
##D ## List available font families
##D sysfonts::font_families()
##D 
##D ## Use the font with the "showtext" package
##D if(require(showtext)) {
##D     wd = setwd(tempdir())
##D     showtext.auto()
##D     
##D     pdf("source-han-serif.pdf")
##D     par(family = "source-han-serif-cn")
##D     plot.new()
##D     box()
##D     text(0.5, 0.9, "\u601d\u6e90\u5b8b\u4f53", cex = 3, font = 2)
##D     text(0.5, 0.4, "\u843d\u5176\u5b9e\u8005\u601d\u5176\u6811", cex = 3)
##D     text(0.5, 0.2, "\u996e\u5176\u6d41\u8005\u6000\u5176\u6e90", cex = 3)
##D     dev.off()
##D     setwd(wd)
##D }
## End(Not run)



