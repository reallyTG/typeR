library(tidyLPA)


### Name: single_imputation
### Title: Apply single imputation to data
### Aliases: single_imputation

### ** Examples

## Not run: 
##D library(ggplot2)
##D library(missForest)
##D library(mclust)
##D 
##D dm <- 2
##D k <- 3
##D n <- 100
##D V <- 4
##D 
##D # Example of one simulation
##D class <- sample.int(k, n, replace = TRUE)
##D dat <- matrix(rnorm(n*V, mean = (rep(class, each = V)-1)*dm), nrow  = n,
##D               ncol = V, byrow = TRUE)
##D results <- estimate_profiles(data.frame(dat), 1:5)
##D plot_profiles(results)
##D compare_solutions(results)
##D 
##D # Simulation for parametric data (i.e., all assumptions of latent profile
##D # analysis met)
##D simulation <- replicate(100, {
##D     class <- sample.int(k, n, replace = TRUE)
##D     dat <- matrix(rnorm(n*V, mean = (rep(class, each = V)-1)*dm), nrow  = n,
##D                   ncol = V, byrow = TRUE)
##D 
##D     d <- prodNA(dat)
##D 
##D     d_mf <- missForest(d)$ximp
##D     m_mf <- Mclust(d_mf, G = 3, "EEI")
##D     d_im <- imputeData(d, verbose = FALSE)
##D     m_im <- Mclust(d_im, G = 3, "EEI")
##D 
##D     class_tabl_mf <- sort(prop.table(table(class, m_mf$classification)),
##D                           decreasing = TRUE)[1:3]
##D     class_tabl_im <- sort(prop.table(table(class, m_im$classification)),
##D                           decreasing = TRUE)[1:3]
##D     c(sum(class_tabl_mf), sum(class_tabl_im))
##D })
##D # Performance on average
##D rowMeans(simulation)
##D # Performance SD
##D colSD(t(simulation))
##D # Plot shows slight advantage for missForest
##D plotdat <- data.frame(accuracy = as.vector(simulation), model =
##D                       rep(c("mf", "im"), n))
##D ggplot(plotdat, aes(x = accuracy, colour = model))+geom_density()
##D 
##D # Simulation for real data (i.e., unknown whether assumptions are met)
##D simulation <- replicate(100, {
##D     d <- prodNA(iris[,1:4])
##D 
##D     d_mf <- missForest(d)$ximp
##D     m_mf <- Mclust(d_mf, G = 3, "EEI")
##D     d_im <- imputeData(d, verbose = FALSE)
##D     m_im <- Mclust(d_im, G = 3, "EEI")
##D 
##D     class_tabl_mf <- sort(prop.table(table(iris$Species,
##D                           m_mf$classification)), decreasing = TRUE)[1:3]
##D     class_tabl_im <- sort(prop.table(table(iris$Species,
##D                           m_im$classification)), decreasing = TRUE)[1:3]
##D     c(sum(class_tabl_mf), sum(class_tabl_im))
##D })
##D 
##D # Performance on average
##D rowMeans(simulation)
##D # Performance SD
##D colSD(t(simulation))
##D # Plot shows slight advantage for missForest
##D plotdat <- data.frame(accuracy = as.vector(tmp),
##D                       model = rep(c("mf", "im"), n))
##D ggplot(plotdat, aes(x = accuracy, colour = model))+geom_density()
## End(Not run)



