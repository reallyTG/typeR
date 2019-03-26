# TODO:   Test for error messages
# 
# Author: Miguel Alvarez
################################################################################

# Example from Alvarez (2017)
library(vegtable)
library(vegtable2)

# Data set and empty "shaker"
Veg <- swea_import("Sweadataveg")
Veg <- transform(Veg, to="percen")
Wetlands <- new("shaker")

# Set pseudospecies
Wetlands <- set_pseudo(Wetlands, Veg, c("Melanthera scandens",
				"Melanthera scandensens"))

# Set species group
# Wrong
Wetlands <- set_group(Wetlands, Veg, group_id="Cyperus papyrus",
		group=c(
				"Cyperus papyrus",
				"Cyclosorus interruptae",
				"Lepistemon owariense"))

# Right (duplicated names will be skipped)
Wetlands <- set_group(Wetlands, Veg, group_id="Cyperus papyrus",
		group=c(
				"Cyperus papyrus",
				"Cyperus papyrus",
				"Cyclosorus interruptus",
				"Lepistemon owariense"))

# Set formula with wrong group name
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE1",
		formula="groups:'Cyperus papa' | species:'Cyperus papyrus > 50'")

# Formula with wrong species name
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE1",
		formula="groups:'Cyperus papyrus' | species:'Cyperus papa > 50'")

# Formula with wrong species name and groups
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE1",
		formula="groups:'Cyperus papyry' | species:'Cyperus papa > 50'")
