library(epanet2toolkit)


### Name: ENnextH
### Title: determine the next hydraulic step
### Aliases: ENnextH

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
  # store simulation times
  t = NULL
  ENopenH()
  ENinitH(11)
  repeat {
    t <- c(t, ENrunH())
    tstep <- ENnextH()
    if (tstep == 0) {
      break
    }
  }
  ENcloseH()
  ENclose()
  



