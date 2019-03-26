library(PSPManalysis)


### Name: PSPMecodyn
### Title: Ecological dynamics of a structured population model computed
###   using the Escalator Boxcar Train
### Aliases: PSPMecodyn

### ** Examples

initstate <- list(Environment = c(1.561e-04, 1.270e-04, 4.008e-06), 
                  Pop00 = matrix(c(0.001, 0, 7.0, 1.0E-5, 300, 111),
                  ncol = 3, byrow = TRUE))
PSPMecodyn("PNAS2002", initstate, c(1, 1, 10, 100))




