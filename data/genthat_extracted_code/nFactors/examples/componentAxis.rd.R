library(nFactors)


### Name: componentAxis
### Title: Principal Component Analysis With Only n First Components
###   Retained
### Aliases: componentAxis
### Keywords: multivariate

### ** Examples

# .......................................................
# Example from Kim and Mueller (1978, p. 10)
# Simulated sample: lower diagnonal
 R <- matrix(c( 1.000, 0.560, 0.480, 0.224, 0.192, 0.16,
                0.560, 1.000, 0.420, 0.196, 0.168, 0.14,
                0.480, 0.420, 1.000, 0.168, 0.144, 0.12,
                0.224, 0.196, 0.168, 1.000, 0.420, 0.35,
                0.192, 0.168, 0.144, 0.420, 1.000, 0.30,
                0.160, 0.140, 0.120, 0.350, 0.300, 1.00),
                nrow=6, byrow=TRUE)
                
# Factor analysis: Selected principal components - Kim and Mueller
# (1978, p. 20)
 componentAxis(R, nFactors=2)

# .......................................................
 


