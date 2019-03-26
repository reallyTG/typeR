library(datasauRus)


### Name: simpsons_paradox
### Title: Simpsons Paradox data
### Aliases: simpsons_paradox
### Keywords: datasets

### ** Examples

if(require(ggplot2)){
  ggplot(simpsons_paradox, aes(x=x, y=y, colour=dataset))+
    geom_point()+
    theme(legend.position = "none")+
    facet_wrap(~dataset, ncol=3)
}



