library(polymapR)


### Name: screen_for_duplicate_individuals
### Title: Screen for duplicate individuals
### Aliases: screen_for_duplicate_individuals

### ** Examples

data("segregating_data")
dupscreened<-screen_for_duplicate_individuals(dosage_matrix=segregating_data,
                                               cutoff=0.9,
                                               plot_cor=TRUE)
## Not run: 
##D #user input:
##D data("segregating_data")
##D screen_for_duplicate_individuals(dosage_matrix=segregating_data, plot_cor=TRUE)
## End(Not run)



