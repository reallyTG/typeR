library(AMR)


### Name: MDRO
### Title: Determine multidrug-resistant organisms (MDRO)
### Aliases: MDRO BRMO MRGN EUCAST_exceptional_phenotypes

### ** Examples

library(dplyr)

septic_patients %>%
  mutate(EUCAST = MDRO(.),
         BRMO = BRMO(.))



