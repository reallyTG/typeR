library(vcdExtra)


### Name: Burt
### Title: Burt (1950) Data on Hair, Eyes, Head and Stature
### Aliases: Burt
### Keywords: datasets

### ** Examples

data(Burt)
mosaic(Freq ~ Hair + Eyes + Head + Stature, data=Burt, shade=TRUE)

#or
burt.tab <- xtabs(Freq ~ Hair + Eyes + Head + Stature, data=Burt)
mosaic(burt.tab, shade=TRUE)



