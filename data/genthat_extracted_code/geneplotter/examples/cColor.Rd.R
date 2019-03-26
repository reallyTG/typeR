library(geneplotter)


### Name: cColor
### Title: A function for marking specific probes on a cPlot.
### Aliases: cColor
### Keywords: utilities

### ** Examples

  if (require("hgu95av2.db")) {
    z <- buildChromLocation("hgu95av2")
    cPlot(z)
    probes <- c("266_s_at", "31411_at", "610_at", "failExample")
    cColor(probes, "red", z)
    probes2 <- c("960_g_at", "41807_at", "931_at", "39032_at")
    cColor(probes2, "blue", z)
  } else
    print("Need hgu95av2.db data package for the example")
  


