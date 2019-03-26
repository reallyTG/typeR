library(ggtern)


### Name: theme_showtitles
### Title: Show or Hide the Axis (Apex) Titles
### Aliases: theme_showtitles theme_hidetitles theme_notitles

### ** Examples

 #Load data
 data(Feldspar)
 ggtern(data=Feldspar,aes(An,Ab,Or)) + geom_point() + theme_bw() + theme_hidetitles()



