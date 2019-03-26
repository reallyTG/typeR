library(logmult)


### Name: plot.assoc
### Title: Plotting Scores from Association Models
### Aliases: plot.assoc plot.rc plot.rc.symm plot.hmskew plot.yrcskew
###   plot.rcL plot.rcL.symm plot.hmskewL

### ** Examples

  ## Wong (2010), Figures 2.2 and 2.3 (p. 50-51)
  data(gss8590)

  ## Not run: 
##D   model <- rc(margin.table(gss8590[,,c(2,4)], 1:2),
##D               nd=2, weighting="none", se="jackknife")
##D   plot(model, what="row", rev.axes=c(TRUE, FALSE), conf.int=0.95)
##D   plot(model, what="col", rev.axes=c(TRUE, FALSE), conf.int=0.95)
##D   
## End(Not run)

  ## Wong (2010), Figures 4.1 and 4.2 (p. 108-109)
  data(gss7590)
  model <- rcL(gss7590, nd=2, weighting="none")

  opar <- par(mfrow=c(2, 2))
  for(i in 1:4)
      plot(model, layer=i, what="rows", rev.axes=c(TRUE, FALSE),
           main=rownames(model$assoc$phi)[i],
           xlim=c(-1.2, 1.2), ylim=c(-1.2, 1.2))

  par(mfrow=c(2, 2))
  for(i in 1:4)
      plot(model, layer=i, what="col", rev.axes=c(TRUE, FALSE),
           main=rownames(model$assoc$phi)[i],
           xlim=c(-1.4, 1.4), ylim=c(-1.2, 1.2))

  par(opar)


  ## van der Heijden & Mooijaart (1995), Figure 1c (p. 23)
  data(ocg1973)
  # 5:1 is here to take "Farmers" as reference category (angle 0)
  model <- hmskew(ocg1973[5:1, 5:1], weighting="uniform")
  # Reproduce the plot from the original article
  plot(model, coords="cartesian")
  # Use a polar coordinates system, which makes more sense in this setting
  plot(model)



