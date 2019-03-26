library(vegtable)


### Name: set_pseudo,set_group,set_formula
### Title: Set slots in shaker objects.
### Aliases: set_group set_group,shaker,taxlist,character-method
###   set_group,shaker,vegtable,character-method set_pseudo
###   set_pseudo,shaker,taxlist,character-method
###   set_pseudo,shaker,vegtable,character-method set_formula
###   set_formula,shaker,taxlist,character-method
###   set_formula,shaker,vegtable,character-method
### Keywords: methods

### ** Examples

library(vegtable)
data(Wetlands)

## Construct the 'shaker' object anew
Wetlands <- new("shaker")

## Set a pseudo-species
Wetlands <- set_pseudo(Wetlands, Wetlands_veg, c("Cyperus latifolius",
				"Cyperus exaltatus"))

## Set a species group
Wetlands <- set_group(Wetlands, Wetlands_veg, group_id="Cyperus papyrus",
		group=c(
                "Cyperus papyrus",
                "Cyclosorus interruptus",
                "Lepistemon owariense"))

## Set a fromula
Wetlands <- set_formula(Wetlands, Wetlands_veg, formula_id="HE1",
		formula="groups:'Cyperus papyrus' | species:'Cyperus papyrus > 50'")

## Summaries
summary(Wetlands)
summary(Wetlands, Wetlands_veg)



