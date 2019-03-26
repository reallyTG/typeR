library(rebmix)


### Name: RCLSMIX-methods
### Title: Predicts Class Membership Based Upon a Model Trained by REBMIX
### Aliases: RCLSMIX RCLSMIX-methods RCLSMIX,RCLSMIX-method
###   RCLSMIX,RCLSMVNORM-method show,RCLSMIX-method show,RCLSMVNORM-method
###   summary,RCLSMIX-method summary,RCLSMVNORM-method
### Keywords: classification

### ** Examples

## Not run: 
##D devAskNewPage(ask = TRUE)
##D 
##D data("adult")
##D 
##D # Find complete cases.
##D 
##D adult <- adult[complete.cases(adult),]
##D 
##D # Replace levels with numbers.
##D 
##D adult <- as.data.frame(data.matrix(adult))
##D 
##D # Find numbers of levels.
##D 
##D cmax <- unlist(lapply(apply(adult[, c(-1, -16)], 2, unique), length))
##D 
##D cmax
##D 
##D # Split adult dataset into train and test subsets for two Incomes
##D # and remove Type and Income columns.
##D 
##D Adult <- split(p = list(type = 1, train = 2, test = 1),
##D   Dataset = adult, class = 16)
##D 
##D # Estimate number of components, component weights and component parameters
##D # for the set of chunks 1:14.
##D 
##D adultest <- list()
##D 
##D for (i in 1:14) {
##D   adultest[[i]] <- REBMIX(Dataset = a.train(chunk(Adult, i)),
##D     Preprocessing = "histogram",
##D     cmax = min(120, cmax[i]),
##D     Criterion = "BIC",
##D     pdf = "Dirac",
##D     K = 1)
##D }
##D 
##D # Class membership prediction based upon the best first search algorithm.
##D 
##D adultcla <- BFSMIX(x = adultest,
##D   Dataset = a.test(Adult),
##D   Zt = a.Zt(Adult))
##D 
##D adultcla
##D 
##D summary(adultcla)
##D 
##D # Plot selected chunks.
##D 
##D plot(adultcla, nrow = 5, ncol = 2)
## End(Not run)



