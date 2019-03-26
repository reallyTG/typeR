library(polymapR)


### Name: screen_for_NA_values
### Title: Screen marker data for NA values
### Aliases: screen_for_NA_values

### ** Examples

data("segregating_data")
data("screened_data")
screened_markers<-screen_for_NA_values(dosage_matrix=segregating_data, margin=1, cutoff=0.1)
screened_indiv<-screen_for_NA_values(dosage_matrix=screened_data, margin=2, cutoff=0.1)
## Not run: 
##D #user input:
##D #screen_for_NA_values(dosage_matrix=segregating_data, margin=1, cutoff=NULL)
## End(Not run)



