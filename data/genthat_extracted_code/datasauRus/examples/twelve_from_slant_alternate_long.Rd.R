library(datasauRus)


### Name: twelve_from_slant_alternate_long
### Title: Twelve From Slant Alternate (long) data
### Aliases: twelve_from_slant_alternate_long
### Keywords: datasets

### ** Examples

if(require(ggplot2)){
  ggplot(twelve_from_slant_alternate_long, aes(x=x, y=y, colour=dataset))+
    geom_point()+
    theme_void()+
    theme(legend.position = "none")+
    facet_wrap(~dataset, ncol=3)
}



