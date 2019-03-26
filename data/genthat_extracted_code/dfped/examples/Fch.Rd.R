library(dfped)


### Name: Fch
### Title: Paediatric bioavailability according to age.
### Aliases: Fch

### ** Examples

## Not run: 
##D     ########
##D     # Note: For this example we are using a paediatric database that we have including data of 
##D     # children from 0 to 19 years old.
##D     ########
##D 
##D     children <- read.csv("/Users/artemistoumazi/paediatric_data_p3m/children_0_19.csv")
##D     AGE <- children$Age
##D     F_ad <- 0.6
##D     Eg <- 0
##D     Eh <- 0.058
##D     f_abs <- F_ad/((1 - Eh)*(1-Eg))
##D     perc_CYPg <- data.frame("CYP3A4_5" = 1)
##D     perc_CYPh <- data.frame("CYP3A4_5" = 0.7, "CYP1A2" = 0.3)
##D     Fch(AGE, f_abs, Eg, Eh, perc_CYPg, perc_CYPh)
## End(Not run)



