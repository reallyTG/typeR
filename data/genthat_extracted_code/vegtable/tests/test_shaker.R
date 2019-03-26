# TODO:   Test for function "make_cocktail"
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

# 1: set species groups
Wetlands <- set_group(Wetlands, Veg, group_id="Cyperus papyrus",
		group=c(
                "Cyperus papyrus",
                "Cyclosorus interruptus",
                "Lepistemon owariense"))
Wetlands <- set_group(Wetlands, Veg, group_id="Cyperus latifolius", group=c(
                "Cyperus latifolius",
                "Ludwigia abyssinica",
                "Lythrum rotundifolium"))
Wetlands <- set_group(Wetlands, Veg, group_id="Centrostachys aquatica", group=c(
                "Centrostachys aquatica",
                "Coldenia procumbens",
                "Heliotropium indicum",
                "Persicaria senegalensis"))
Wetlands <- set_group(Wetlands, Veg, group_id="Pistia stratiotes", group=c(
                "Pistia stratiotes",
                "Eichhornia crassipes",
                "Azolla pinnata ssp. africana"))
Wetlands <- set_group(Wetlands, Veg, group_id="Azolla nilotica", group=c(
                "Azolla nilotica",
                "Lemna aequinoctialis"))
Wetlands <- set_group(Wetlands, Veg, group_id="Ammannia prieuriana", group=c(
                "Ammannia prieuriana",
                "Ethulia conyzoides",
                "Leersia hexandra"))

# 2: Writing formulas (note the implemented syntax)
Wetlands <- set_formula(Wetlands, Veg, formula_id="HY1",
		formula="groups:'Pistia stratiotes' & groups:'Azolla nilotica'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HY2",
		formula="species:'Nymphaea lotus > 25'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE1",
		formula="groups:'Cyperus papyrus' | species:'Cyperus papyrus > 50'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE2",
		formula="species:'Typha domingensis > 25'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE3",
		formula="species:'Cyperus exaltatus > 50'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE4",
		formula="groups:'Cyperus latifolius'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE5",
		formula="species:'Phragmites australis > 50'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE6",
		formula="species:'Panicum subalbidum > 50'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HE7",
		formula="groups:'Ammannia prieuriana'")
Wetlands <- set_formula(Wetlands, Veg, formula_id="HY1",
		formula="groups:'Centrostachys aquatica'")

# Set pseudospecies
Wetlands <- set_pseudo(Wetlands, Veg, c("Melanthera scandens",
				"Melanthera scandens s. madagascariensis"))

# Summaries
summary(Wetlands)
summary(Wetlands, Veg)

# Classify with 'make_cocktail'
Veg@header <- make_cocktail(Wetlands, Veg, cover="percen")
Veg <- subset(Veg, !is.na(Syntax), slot="header")
summary(Veg)
summary(as.factor(Veg@header$Syntax))
