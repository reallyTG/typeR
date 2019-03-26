library(mixtox)


### Name: curveFit
### Title: Curve Fitting
### Aliases: curveFit
### Keywords: curve fitting dose-response curve goodness of fit quantal
###   dose-reponses continuous dose-reponses hormesis dose-reponses
###   response range effect concentration

### ** Examples

## example 1
# Fit hormesis dose-response data.
# Calculate the concentrations that cause 5% of 50% inhibition.
x <- hormesis$OmimCl$x
rspn <- hormesis$OmimCl$y
curveFit(x, rspn, eq = 'Biphasic', param = c(-0.34, 0.001, 884, 0.01, 128), 
			effv = 0.5, rtype = 'hormesis')

x <- hormesis$HmimCl$x
rspn <- hormesis$HmimCl$y
curveFit(x, rspn, eq = 'Biphasic', param = c(-0.59, 0.001, 160,0.05, 19),  
			effv = c(0.05, 0.5), rtype = 'hormesis')

x <- hormesis$ACN$x
rspn <- hormesis$ACN$y
curveFit(x, rspn, eq = 'Brain_Consens', param = c(2.5, 2.8, 0.6, 2.44),  
			effv = c(0.05, 0.5), rtype = 'hormesis')

x <- hormesis$Acetone$x
rspn <- hormesis$Acetone$y
curveFit(x, rspn, eq = 'BCV', param = c(1.0, 3.8, 0.6, 2.44),  effv = c(0.05, 0.5), 
			rtype = 'hormesis')

## example 2
# Fit quantal dose-responses: the inhibition of heavy metal Ni(2+) on the growth of MCF-7 cells.
# Calculate the concentrations that cause 5% and 50% inhibition. 
x <- cytotox$Ni$x
rspn <- cytotox$Ni$y
curveFit(x, rspn, eq = 'Logit', param = c(12, 3), effv = c(0.05, 0.5), rtype = 'quantal')

## example 3
# Fit quantal dose-responses: the inhibition effect of Paromomycin Sulfate (PAR) on photobacteria.
# Calculate the concentrations that cause 5% and 50% inhibition.
x <- antibiotox$PAR$x
rspn <- antibiotox$PAR$y
curveFit(x, rspn, eq = 'Logit', param = c(26, 4), effv = c(0.05, 0.5))



