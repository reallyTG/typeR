library(dfped)


### Name: Clchu
### Title: Clearance of the unbound fraction of a specific molecule for the
###   paediatric population.
### Aliases: Clchu

### ** Examples

## Not run: 
##D     ########
##D     # Note: For this example we are using a paediatric database that we have including data of 
##D     # children from 0 to 19 years old.
##D     ########
##D 
##D     children <- read.csv("/Users/artemistoumazi/paediatric_data_p3m/children_0_19.csv")
##D     AGE <- children$Age
##D     W <- children$Weight
##D     W_ad <- 70
##D     Cl_ad <- 3.95
##D     F_ad <- 0.6
##D     Eg <- 0
##D     Eh <- 0.058
##D     f_abs <- F_ad/((1 - Eh)*(1-Eg))
##D     fu_ad <- 1
##D     perc_CYPh <- data.frame("CYP3A4_5" = 0.7, "CYP1A2" = 0.3)
##D 
##D     Clchu(AGE, W, Cl_ad, W_ad, f_abs, fu_ad, F_ad, Eg, Eh, perc_CYPh)
## End(Not run)



