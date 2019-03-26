library(vcdExtra)


### Name: Glass
### Title: British Social Mobility from Glass(1954)
### Aliases: Glass
### Keywords: datasets

### ** Examples

data(Glass)
glass.tab <- xtabs(Freq ~ father + son, data=Glass)

largs <- list(set_varnames=list(father="Father's Occupation", son="Son's Occupation"),
              abbreviate=10)
gargs <- list(interpolate=c(1,2,4,8))
mosaic(glass.tab, shade=TRUE, labeling_args=largs, gp_args=gargs,
  main="Alphabetic order", legend=FALSE, rot_labels=c(20,90,0,70))

# reorder by status
ord <- c(2, 1, 4, 3, 5) 
mosaic(glass.tab[ord, ord], shade=TRUE, labeling_args=largs,  gp_args=gargs,
  main="Effect order", legend=FALSE, rot_labels=c(20,90,0,70))




