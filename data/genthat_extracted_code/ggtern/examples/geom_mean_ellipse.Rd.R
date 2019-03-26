library(ggtern)


### Name: geom_mean_ellipse
### Title: Mean Ellipse
### Aliases: geom_mean_ellipse stat_mean_ellipse StatMeanEllipse
### Keywords: datasets

### ** Examples

  data(Feldspar)
  ggtern(data=Feldspar,aes(An,Ab,Or)) + 
    geom_point() + 
    geom_mean_ellipse()
data(Feldspar)
ggtern(data=Feldspar,aes(Ab,An,Or)) +
  theme_bw() + 
  stat_mean_ellipse(geom='polygon',steps=500,fill='red',color='black') +
  geom_point()



