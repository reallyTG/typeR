library(oncomodel)


### Name: oncomodel-package
### Title: Maximum likelihood tree models for oncogenesis
### Aliases: oncomodel-package oncomodel
### Keywords: package

### ** Examples

  ## NOT RUN
  ## The example needs longer run time.
  #data(kidney)
  ##  Maximum likelihood tree model
  #y <- MLtopology(kidney$x)
  
  ## Graphical presentation
  #y.phyl <- newick2phylog(y$newick)
  #plot.phylog(y.phyl, cnodes =1,  clabel.n=0.6, f=0.75, sub="Oncogenetic tree of given aberrations")

  ## Bootstrap confidence values (in percent) and the splits occurring in
  ## more than 10 percent of the bootstrap data sets 
  #boot.conf.values(kidney$x, nrep=2)

  ## Probability for aberration -3|-3p
  #leafset.prob(c("-3|-3p", "+5|+5q"), kidney$res)

  ## Probability for aberration -3|-3p
  #leafset.prob2(c("-3|-3p", "+5|+5q"), kidney$res)
  ## END(NOT RUN)



