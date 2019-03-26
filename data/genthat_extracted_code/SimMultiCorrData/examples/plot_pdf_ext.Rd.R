library(SimMultiCorrData)


### Name: plot_pdf_ext
### Title: Plot Theoretical Power Method Probability Density Function and
###   Target PDF of External Data for Continuous Variables
### Aliases: plot_pdf_ext
### Keywords: Fleishman, Headrick external, pdf, plot, theoretical,

### ** Examples

## Not run: 
##D # Logistic Distribution
##D 
##D seed = 1234
##D 
##D # Simulate "external" data set
##D set.seed(seed)
##D ext_y <- rlogis(10000)
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
##D # Plot invalid power method pdf with external data
##D plot_pdf_ext(c = con1$constants, method = "Polynomial",
##D              title = "Invalid Logistic PDF", ext_y = ext_y,
##D              seed = seed)
##D 
##D # Find constants with the sixth cumulant correction
##D # (valid power method pdf)
##D con2 <- find_constants(method = "Polynomial", skews = stcum[3],
##D                       skurts = stcum[4], fifths = stcum[5],
##D                       sixths = stcum[6], Six = seq(1.5, 2, 0.05))
##D 
##D # Plot invalid power method pdf with external data
##D plot_pdf_ext(c = con2$constants, method = "Polynomial",
##D              title = "Valid Logistic PDF", ext_y = ext_y,
##D              seed = seed)
## End(Not run)




