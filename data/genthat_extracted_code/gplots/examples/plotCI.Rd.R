library(gplots)


### Name: plotCI
### Title: Plot Error Bars and Confidence Intervals
### Aliases: plotCI
### Keywords: hplot

### ** Examples


  # plot means and
  data(state)
  tmp   <- split(state.area, state.region)
  means <- sapply(tmp, mean)
  stdev <- sqrt(sapply(tmp, var))
  n     <- sapply(tmp,length)
  ciw   <- qt(0.975, n) * stdev / sqrt(n)

  # plain
  plotCI(x=means, uiw=ciw)

  # prettier
  plotCI(x=means, uiw=ciw, col="black", barcol="blue", lwd=1)

  # give mean values
  plotCI(x=means, uiw=ciw, col="black", barcol="blue",
         labels=round(means,-3), xaxt="n", xlim=c(0,5) )
  axis(side=1, at=1:4, labels=names(tmp), cex=0.7)

  # better yet, just use plotmeans ... #
  plotmeans( state.area ~ state.region )

## Don't show: 
## Just for testing
  plotCI(x=means, uiw=NA)
  plotCI(x=means, uiw=NULL)
  plotCI(x=means, uiw=ciw)
  plotCI(x=means, uiw=ciw, liw=NULL)
  plotCI(x=means, uiw=ciw, liw=NA)
  plotCI(x=means, liw=ciw, ciw=NULL)
  plotCI(x=means, liw=ciw, ciw=NA)
  ciw.na <- ciw
  ciw.na[3] <- NA
  plotCI(x=means, uiw=ciw.na, liw=ciw)
  plotCI(x=means, liw=ciw.na, uiw=ciw)
## End(Don't show)





