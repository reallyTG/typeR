library(dfped)


### Name: Clch.Allo
### Title: Paediatric clearance according to the allometry adjustment (AA)
###   for a specific age.
### Aliases: Clch.Allo

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
##D 
##D     Clch_allo <- Clch.Allo(AGE, W, Cl_ad, W_ad)
## End(Not run)



