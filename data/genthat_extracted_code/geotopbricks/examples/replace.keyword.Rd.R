library(geotopbricks)


### Name: replace.keyword
### Title: It replaces some keyword values of 'geotop.inpts' file with the
###   ones of anoter '*.inpts' value
### Aliases: replace.keyword

### ** Examples


library(geotopbricks)
wpath <- system.file('template/meteo_ex',package="geotopbricks")
x <- "meteo.inpts"
zl <- replace.keyword(x,wpath=wpath,write.file.output=FALSE)






