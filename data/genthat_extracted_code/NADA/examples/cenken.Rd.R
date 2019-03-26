library(NADA)


### Name: cenken
### Title: Compute Kendall's tau correlation coefficient and associated
###   line for censored data.  Computes the Akritas-Theil-Sen nonparametric
###   line, with the Turnbull estimate of intercept.
### Aliases: cenken
### Keywords: regression

### ** Examples

    # Both y and x are censored
    # (exercise 11-1 on pg 198 of the NADA book)
    data(Golden)
    with(Golden, cenken(Blood, BloodCen, Kidney, KidneyCen))

    ## Not run: 
##D     # x is not censored
##D     # (example on pg 213 of the NADA book)
##D     data(TCEReg)
##D     with(TCEReg, cenken(log(TCEConc), TCECen, PopDensity))
##D     # formula interface
##D     with(TCEReg, cenken(Cen(log(TCEConc), TCECen)~PopDensity))
##D 
##D     # Plotting data and the regression line
##D     data(DFe)
##D     # Recall x and y parameter positons are swapped in plot vs regression calls
##D     with(DFe, cenxyplot(Year, YearCen, Summer, SummerCen))    # x vs. y
##D     reg = with(DFe, cenken(Summer, SummerCen, Year, YearCen)) # y~x
##D     lines(reg)
##D     
## End(Not run)



