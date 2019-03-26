library(hsdar)


### Name: sr
### Title: Simple ratio index
### Aliases: sr
### Keywords: multivariate

### ** Examples

data(spectral_data)

## Calculate SR	of Jordan (1969) (R_{800}/R_{680})
sr_600_680 <- sr(spectral_data, b1=800, b2=680)

## Calculate all possible combinations for WorldView-2-8
spec_WV <- spectralResampling(spectral_data, "WorldView2-8",
                              response_function = FALSE)
sr_WV <- sr(spec_WV, recursive = TRUE)
sr_WV



