library(biogeo)


### Name: quickrich
### Title: Perform error checks and produce richness map
### Aliases: quickrich

### ** Examples

ex1 <- c(15,35,-36,-23) # set the extent
rich<-quickrich(dat,world,ID='ID',Species='Species',x='x',y='y',
countries = "",others='',res=60,msk=msk60,ext=ex1)



