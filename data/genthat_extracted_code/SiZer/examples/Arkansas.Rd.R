library(SiZer)


### Name: Arkansas
### Title: Time Series of Macroinvertabrates Abundance in the Arkansas
###   River.
### Aliases: Arkansas
### Keywords: datasets

### ** Examples

require(ggplot2)

data(Arkansas)
ggplot(Arkansas, aes(x=year, y=sqrt.mayflies)) + 
   geom_point()




