library(sysfonts)


### Name: font_add
### Title: Add New Font Families to 'sysfonts'
### Aliases: font_add font.add

### ** Examples

## Not run: 
##D ## Example: download the font file of WenQuanYi Micro Hei,
##D ##          add it to SWF device, and use it to draw text in swf().
##D ##          WenQuanYi Micro Hei is an open source and high quality
##D ##          Chinese (and CJKV) font.
##D 
##D wd = setwd(tempdir())
##D ft.url = "http://sourceforge.net/projects/wqy/files/wqy-microhei"
##D ft.url = paste(ft.url, "0.2.0-beta/wqy-microhei-0.2.0-beta.tar.gz",
##D                sep = "/")
##D download.file(ft.url, basename(ft.url))
##D 
##D ## Extract and add the directory to search path
##D untar(basename(ft.url), compressed = "gzip")
##D font_paths("wqy-microhei")
##D 
##D ## Register this font file and assign the family name "wqy"
##D ## Other font faces will be the same with regular by default
##D font_add("wqy", regular = "wqy-microhei.ttc")
##D 
##D ## A more concise way to add font is to give the path directly,
##D ## without calling font_paths()
##D # font_add("wqy", "wqy-microhei/wqy-microhei.ttc")
##D 
##D ## List available font families
##D font_families()
##D 
##D if(require(R2SWF))
##D {
##D     ## Now it shows that we can use the family "wqy" in swf()
##D     swf("testfont.swf")
##D 
##D     ## Select font family globally
##D     op = par(family = "serif", font.lab = 2)
##D     ## Inline selecting font
##D     plot(1, type = "n")
##D     text(1, 1, intToUtf8(c(20013, 25991)), family = "wqy", font = 1, cex = 2)
##D 
##D     dev.off()
##D     swf2html("testfont.swf")
##D }
##D 
##D setwd(wd)
##D 
## End(Not run)



