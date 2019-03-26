library(PCRedux)


### Name: visdat_pcrfit
### Title: Visualizing the content of data from an analysis with the
###   pcrfit_single function
### Aliases: visdat_pcrfit

### ** Examples

# First Example
# The observations "A01", "A02", "A04" and "B04" from the 
# ``C126EG685`` dataset were analyzed with the ``encu()`` 
# function. Finally, the data were visualized with the 
# ``visdat_pcrfit()`` function. In this example the static 
# plot is shown (\autoref{visdat_pcrfit_plot}). It is also 
# possible to run the function interactively by setting the 
# parameter `interactive=TRUE`. In this case starts an 
# interactive, browser-based charting library that uses 
# ECMA Script. The interactive plot are rendered entirely 
# locally, through a HTML widgets framework.
# Calculate curve features of an amplification curve 
# dataset. Use the C126EG685 dataset from the chipPCR 
# package and analyze the observationsA01, A02, A04 and B05.
## Not run: 
##D library(chipPCR)
##D library(PCRedux)
##D 
##D res <- encu(C126EG685[, c(1,2,3,5,17)])
##D 
##D # Show all results in a plot. Note that the interactive parameter is set to
##D # FALSE. For each observation, the classes (factor, 
##D # integer, logical, numeric, NA) are presented. 
##D # For the observations 2 and 4 the parameter 
##D # `loglin\\_slope` could not be calculated (returned NA).
##D 
##D visdat_pcrfit(res, type = "all", interactive = FALSE)
## End(Not run)

# Second Example
# Calculate curve features of an amplification curve data. Note that not all
# available CPU cores are used. If need set "all" to use all available cores.
library(qpcR)
# take the samples F1.1 (positive) and F1.3 (negative) for this example.

test_data <- testdat[, c(1,2,4)]

# Plot the amplification curves

matplot(test_data[, 1], test_data[, -1], xlab="Cycle", ylab="RFU",
        main="testdat data set", type="l", lty=1, lwd=2, col=1:2)
legend("topleft", paste(colnames(test_data)[-1], c("pos", "neg")),
       pch=19, col=1:2)

# Analyze the amplification curves with the pcrfit_single function
res_1 <- cbind(runs="F1.1", pcrfit_single(test_data[, 2]))
res_2 <- cbind(runs="F1.3", pcrfit_single(test_data[, 3]))
res <- rbind(F1.1=res_1, F1.3=res_2)

# Show all results in an interactive plot
visdat_pcrfit(res)



