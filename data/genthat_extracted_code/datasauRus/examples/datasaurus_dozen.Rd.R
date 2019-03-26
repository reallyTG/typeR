library(datasauRus)


### Name: datasaurus_dozen
### Title: Datasaurus Dozen data
### Aliases: datasaurus_dozen
### Keywords: datasets

### ** Examples

if(require(ggplot2)){
  ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset))+
    geom_point()+
    theme_void()+
    theme(legend.position = "none")+
    facet_wrap(~dataset, ncol=3)
}



