library(irr)


### Name: kappam.fleiss
### Title: Fleiss' Kappa for m raters
### Aliases: kappam.fleiss
### Keywords: univar

### ** Examples

data(diagnoses)
kappam.fleiss(diagnoses)               # Fleiss' Kappa
kappam.fleiss(diagnoses, exact=TRUE)   # Exact Kappa
kappam.fleiss(diagnoses, detail=TRUE)  # Fleiss' and category-wise Kappa

kappam.fleiss(diagnoses[,1:4])         # Fleiss' Kappa of raters 1 to 4



