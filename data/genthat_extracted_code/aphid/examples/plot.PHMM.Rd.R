library(aphid)


### Name: plot.PHMM
### Title: Plot profile hidden Markov models.
### Aliases: plot.PHMM

### ** Examples

  ## Small globin alignment example from Durbin et al (1998) Figure 5.3
  data(globins)
  ## derive a profile hidden Markov model from the alignment
  globins.PHMM <- derivePHMM(globins, residues = "AMINO", seqweights = NULL)
  ## plot the PHMM
  plot(globins.PHMM, main = "Profile hidden Markov model for globins")
  ##
  ## derive a profile hidden Markov model from the woodmouse dataset in the
  ## ape package
  library(ape)
  data(woodmouse)
  woodmouse.PHMM <- derivePHMM(woodmouse)
  ## plot partial model to viewer device
  plot(woodmouse.PHMM, from = 0, to = 5)
  ## plot the entire model to a PDF in the current working directory
  ## No test: 
  tmpf <- tempfile(fileext = ".pdf")
  nr <- ceiling((woodmouse.PHMM$size + 2)/10)
  pdf(file = tmpf, width = 8.27, height = nr * 2)
  par(mfrow = c(nr, 1), mar = c(0, 0, 0, 0) + 0.1)
  from <- 0
  to <- 10
  for(i in 1:nr){
    plot(woodmouse.PHMM, from = from, to = to, just = "left")
    from <- from + 10
    to <- min(to + 10, woodmouse.PHMM$size + 1)
  }
  dev.off()
  
## End(No test)



