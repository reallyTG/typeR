library(geotopbricks)


### Name: create.geotop.inpts.keyword
### Title: Creates an 'geotop.inpts' files the keyword and their values of
###   a date.frame like the one returned by
###   'declared.geotop.inpts.keywords'
### Aliases: create.geotop.inpts.keyword

### ** Examples


library(geotopbricks)

#Simulation working path
wpath <- 'http://www.rendena100.eu/public/geotopbricks/simulations/panola13_run2xC_test3'
df <- declared.geotop.inpts.keywords(wpath=wpath)
create.geotop.inpts.keyword(df=df)






