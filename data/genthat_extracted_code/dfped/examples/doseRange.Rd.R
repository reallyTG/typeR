library(dfped)


### Name: doseRange
### Title: Dose-range for the paediatric population according to adult
###   clearance, adult doses and paediatric clearance.
### Aliases: doseRange

### ** Examples

## Not run: 
##D  
##D     ########
##D     # Note: For this example we are using a paediatric database that we have including data of 
##D     # children from 0 to 19 years old.
##D     ########
##D 
##D 
##D     # Doses of adults
##D     doseAd <- data.frame("d1" = 100, "d2" = 150,"d3" = 200,"d4"= 250,"d5" =300)
##D     
##D     Cl_ad <- 3.95
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
##D     perc_CYPg <- data.frame("CYP3A4_5" = 1)
##D     perc_alb <- 1
##D     perc_alpha1AG <- 0 
##D 
##D     data_molecule <- list(F_ad, f_abs, Eg, Eh, fu_ad, perc_CYPg, perc_CYPh, perc_alb, 
##D                           perc_alpha1AG)
##D 
##D     # Compute the clearance of children using maturation adjustment via 
##D     # the function Clch.Mat().
##D     Clch_mat <- Clch.Mat(AGE, W, Cl_ad, W_ad, data_molecule)
##D     
##D     doseRange(Clch_mat, Cl_ad, doseAd)
## End(Not run)



