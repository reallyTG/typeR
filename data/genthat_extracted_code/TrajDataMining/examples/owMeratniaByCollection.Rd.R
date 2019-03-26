library(TrajDataMining)


### Name: owMeratniaByCollection
### Title: Ow Meratnial By Collection
### Aliases: owMeratniaByCollection
###   owMeratniaByCollection,TracksCollection,numeric,numeric-method

### ** Examples


library(magrittr)

library(sp)

library(ggplot2)
ow <-owMeratniaByCollection(tracksCollection,13804.84 ,0.03182201) %>% coordinates()

df <- data.frame(x=ow[,1],y=ow[,2])

ggplot(df,aes(x=x,y=y))+geom_path(aes(group = 1), arrow = arrow(),color='blue')



