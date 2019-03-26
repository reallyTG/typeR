library(ape)


### Name: label2table
### Title: Label Management
### Aliases: label2table stripLabel abbreviateGenus
### Keywords: manip

### ** Examples

x <- c("Panthera_leo", "Panthera_pardus", "Panthera_onca", "Panthera_uncia",
       "Panthera_tigris_altaica", "Panthera_tigris_amoyensis")
label2table(x)
stripLabel(x)
stripLabel(x, TRUE)
abbreviateGenus(x)
abbreviateGenus(x, species = TRUE)
abbreviateGenus(x, genus = FALSE, species = TRUE)



