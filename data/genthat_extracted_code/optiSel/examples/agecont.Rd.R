library(optiSel)


### Name: agecont
### Title: Contributions of age cohorts to the population
### Aliases: agecont

### ** Examples


data(PedigWithErrors)
Pedig <- prePed(PedigWithErrors)
use   <- Pedig$Breed=="Hinterwaelder" & !is.na(Pedig$Born)
use   <- use & Pedig$Born>=2000 & Pedig$Born<=2004 

# Calculate the contribution of each age class ##

cont <- agecont(Pedig, use)

# Contribution of each age class to 
# the current population:

head(cont)

# Note: In this case, young males have a higher contribution to the  
# population than young females because they are used for breeding 
# for a shorter time span, i.e. they are culled earlier.

# Males and females (excluding the newborn individuals)
# have equal contributions to the current population:

sum(cont$male[-1])
#[1] 0.3925894

sum(cont$female[-1])
#[1] 0.3925894


# The total contribution of classes to the curent population is equal to 1 

sum(cont$female) + sum(cont$male) 
#[1] 1

# When used for OCS, the contribution of the offspring to the 
# population in the next year is equal to the contribution of the individuals
# born in this year to the current population:

cont$male[1]+cont$female[1]
#[1] 0.2148212

# This is approximately 1/L, where L is the generation interval.




