library(showtext)


### Name: showtext_begin
### Title: Rendering Text for R Graphics Devices
### Aliases: showtext_begin showtext.begin

### ** Examples

## Not run: 
##D old = setwd(tempdir())
##D 
##D ###  Enable pdf() to draw Chinese characters nicely  ###
##D ###  Requires the simkai.ttf font file, usually      ###
##D ###  installed in Windows                            ###
##D 
##D ## First, open the device
##D pdf("showtext-ex1.pdf")
##D 
##D ## For now we are using the original device functions to draw axis labels
##D plot(1, type = "n")
##D 
##D ## Then turn showtext on and draw some characters
##D showtext_begin()
##D text(1, 1.2, intToUtf8(c(21315, 31179, 19975, 36733)), cex = 5)
##D 
##D ## Use another font
##D if("simkai.ttf" %in% font_files()) font_add("kaishu", "simkai.ttf")
##D text(1, 0.8, intToUtf8(c(19968, 32479, 27743, 28246)),
##D      cex = 5, family = "kaishu")
##D      
##D ## Turn showtext off
##D showtext_end()
##D 
##D ## Also turn off the device
##D dev.off()
##D 
##D 
##D ###  Download font file from web  ###
##D 
##D download.file("http://fontpro.com/download-family.php?file=36289",
##D               "newrocker.ttf", mode="wb")
##D download.file("http://fontpro.com/download-family.php?file=35128",
##D               "cutetumblr.ttf", mode ="wb")
##D 
##D font_add("newrocker", "newrocker.ttf")
##D font_add("cutetumblr", "cutetumblr.ttf")
##D 
##D png("showtext-ex2.png", 800, 500)
##D plot(1, type = "n")
##D showtext_begin()
##D text(1, 1.2, "Let me tell you a story", cex = 4, family = "newrocker")
##D text(1, 0.8, "Long long ago...", cex = 4, family = "cutetumblr")
##D showtext_end()
##D dev.off()
##D 
##D setwd(old)
##D 
## End(Not run)



