library(ggtern)


### Name: geom_smooth_tern
### Title: Add a Smoothed Conditional Mean.
### Aliases: geom_smooth_tern GeomSmoothTern stat_smooth_tern
###   StatSmoothTern
### Keywords: datasets

### ** Examples

data(Feldspar)
ggtern(data=Feldspar,aes(Ab,An,Or,group=Feldspar)) +  
  geom_smooth_tern(method=lm,fullrange=TRUE,colour='red') + 
  geom_point() +
  labs(title="Example Smoothing")



