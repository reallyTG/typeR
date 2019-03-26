library(tabula)


### Name: plotBar
### Title: Bar plot
### Aliases: plotBar plotBar-method seriographe plotBar,CountMatrix-method
###   plotBar,FrequencyMatrix-method

### ** Examples

## Not run: 
##D 
##D # Coerce dataset to abundance matrix
##D # Data from Desachy 2004
##D count <- as(compiegne, "CountMatrix")
##D freq <- as(boves, "FrequencyMatrix")
##D 
##D # Plot Ford diagram...
##D ## ...without threshold
##D plotBar(count)
##D plotBar(freq)
##D 
##D ## ...with EPPM (i.e. Bruno Desachy's sériographe)
##D plotBar(count, EPPM = TRUE)
##D plotBar(freq, EPPM = TRUE)
##D 
##D # Plot Bertin diagram...
##D ## ...without EPPM...
##D plotBar(count, center = FALSE, horizontal = TRUE)
##D ## ...and confidence intervals
##D plotBar(freq, level = FALSE, center = FALSE, horizontal = FALSE)
##D 
##D ## ...with EPPM (i.e. Bruno Desachy's sériographe)
##D plotBar(count, EPPM = TRUE, center = FALSE, horizontal = TRUE)
## End(Not run)



