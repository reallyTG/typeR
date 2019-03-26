library(PTXQC)


### Name: plot_MissedCleavages
### Title: Plot bargraph of missed cleavages.
### Aliases: plot_MissedCleavages

### ** Examples

  data = data.frame(fc.raw.file = letters[1:5],
                    MC0 = c(0.8, 0.5, 0.85, 0.2, 0.9),
                    MC1 = c(0.1, 0.4, 0.05, 0.7, 0.0),
                    "MS2+" =  c(0.1, 0.1, 0.1, 0.1, 0.1),
                    check.names = FALSE)
  plot_MissedCleavages(data, "contaminant inclusion unknown")




