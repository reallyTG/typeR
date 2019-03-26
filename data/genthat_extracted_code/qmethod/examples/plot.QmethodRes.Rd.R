library(qmethod)


### Name: plot.QmethodRes
### Title: Q Method: plot for statement z-scores
### Aliases: plot.QmethodRes
### Keywords: plot

### ** Examples

data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax")
title <- "Q method z-scores, lipset dataset"
subtitle <- paste0("Three factors, PCA, varimax. Printed on ",
                  Sys.Date())
plot(results, main = title, sub = subtitle)

# Order the items in a different way
plot(results, main = title, sub = subtitle, 
     sort.items = c(rev(1:nrow(results$zsc))))



