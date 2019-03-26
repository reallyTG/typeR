library(SimMultiCorrData)


### Name: plot_pdf_theory
### Title: Plot Theoretical Power Method Probability Density Function and
###   Target PDF by Distribution Name or Function for Continuous Variables
### Aliases: plot_pdf_theory
### Keywords: Fleishman, Headrick pdf, plot, theoretical,

### ** Examples

## Not run: 
##D # Logistic Distribution
##D 
##D # Find standardized cumulants
##D stcum <- calc_theory(Dist = "Logistic", params = c(0, 1))
##D 
##D # Find constants without the sixth cumulant correction
##D # (invalid power method pdf)
##D con1 <- find_constants(method = "Polynomial", skews = stcum[3],
##D                       skurts = stcum[4], fifths = stcum[5],
##D                       sixths = stcum[6])
##D 
##D # Plot invalid power method pdf with theoretical pdf overlayed
##D plot_pdf_theory(c = con1$constants, method = "Polynomial",
##D          title = "Invalid Logistic PDF", overlay = TRUE,
##D          Dist = "Logistic", params = c(0, 1))
##D 
##D # Find constants with the sixth cumulant correction
##D # (valid power method pdf)
##D con2 <- find_constants(method = "Polynomial", skews = stcum[3],
##D                       skurts = stcum[4], fifths = stcum[5],
##D                       sixths = stcum[6], Six = seq(1.5, 2, 0.05))
##D 
##D # Plot valid power method pdf with theoretical pdf overlayed
##D plot_pdf_theory(c = con2$constants, method = "Polynomial",
##D          title = "Valid Logistic PDF", overlay = TRUE,
##D          Dist = "Logistic", params = c(0, 1))
## End(Not run)




