library(sfsmisc)


### Name: histBxp
### Title: Plot a Histogram and a Boxplot
### Aliases: histBxp
### Keywords: hplot

### ** Examples

 lab <- "50 samples from a t distribution with 5 d.f."
 mult.fig(2*3, main = "Hist() + Rug()   and    histBxp(*)")
 for(i in 1:3) {
   my.sample <-  rt(50, 5)
   hist(my.sample, main=lab); rug(my.sample)# for 50 obs., this is ok, too..
   histBxp(my.sample, main=lab)
 }



