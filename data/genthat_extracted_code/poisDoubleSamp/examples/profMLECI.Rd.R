library(poisDoubleSamp)


### Name: profMLECI
### Title: Compute the profile MLE CI of phi
### Aliases: profMLECI

### ** Examples

## Not run: 
##D 
##D # small example
##D z11 <- 34; z12 <- 35; N1 <- 10;
##D z21 <- 22; z22 <- 31; N2 <- 10;
##D m011 <- 9; m012 <- 1; y01 <- 3; N01 <- 3;
##D m021 <- 8; m022 <- 8; y02 <- 2; N02 <- 3;
##D data <- c(z11, z12, z21, z22, m011, m012, m021, m022, y01, y02)
##D 
##D waldCI(data, N1, N2, N01, N02)
##D margMLECI(data, N1, N2, N01, N02)
##D profMLECI(data, N1, N2, N01, N02)
##D approxMargMLECI(data, N1, N2, N01, N02)
##D 
##D 
##D # big example :
##D z11 <- 477; z12 <- 1025; N1 <- 16186;
##D z21 <- 255; z22 <- 1450; N2 <- 18811;
##D m011 <- 38;  m012 <- 90; y01 <- 15; N01 <- 1500;
##D m021 <- 41; m022 <- 200; y02 <-  9; N02 <- 2500;
##D data <- c(z11, z12, z21, z22, m011, m012, m021, m022, y01, y02)
##D 
##D waldCI(data, N1, N2, N01, N02)
##D margMLECI(data, N1, N2, N01, N02)
##D profMLECI(data, N1, N2, N01, N02)
##D approxMargMLECI(data, N1, N2, N01, N02)
##D 
##D 
##D 
## End(Not run)



