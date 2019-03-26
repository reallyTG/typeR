library(protViz)


### Name: peakplot
### Title: Labelling of Peptide Fragment Mass Spectra
### Aliases: peakplot.label peakplot.putlabel peakplot.pie peakplot protViz
###   plot.psm

### ** Examples


    data(msms)
    op <- par(mfrow=c(2,1))
    peakplot("TAFDEAIAELDTLNEESYK", msms[[1]])
    peakplot("TAFDEAIAELDTLSEESYK", msms[[2]])
    par(op)


    # filter cand. fragment ions
    fi <- fragmentIon("TAFDEAIAELDTLNEESYK")
    fi.cyz <- as.data.frame(cbind(c=fi[[1]]$c, y=fi[[1]]$y, z=fi[[1]]$z))

    p <- peakplot("TAFDEAIAELDTLNEESYK", spec=msms[[1]],
        fi=fi.cyz,
        itol=0.6,
        ion.axes=FALSE)
        
          
    # customizing the ion series
    ions <- function(b, y){
      Hydrogen <- 1.007825
      Oxygen <- 15.994915
      Nitrogen <- 14.003074
  
      y0 <- fi$y - Oxygen - Hydrogen - Hydrogen
      c <- b + (Nitrogen + (3 * Hydrogen))
      z <- y - (Nitrogen + (3 * Hydrogen))
      
      return(cbind(b, y, c ,z, y0))
  }




