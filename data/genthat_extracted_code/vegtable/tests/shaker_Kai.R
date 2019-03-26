# TODO:   A test for Kai
# 
# Author: Miguel Alvarez
################################################################################

library(vegtable)
library(vegtable2)

# Import data
Veg <- swea_import("Sweadataveg")
Veg <- transform(Veg, to="percen")

# Create empty shaker
Syntax <- new("shaker")

# Set groups
Syntax <- set_group(Syntax, Veg, group_id="Cyperus latifolius", group=c(
				"Cyperus latifolius",
				"Ludwigia abyssinica",
				"Lythrum rotundifolium"))
Syntax <- set_group(Syntax, Veg, group_id="Cyperus difformis", group=c(
				"Ageratum conyzoides",
				"Cyperus difformis",
				"Cyperus distans",
				"Eleusine indica",
				"Kyllinga odorata",
				"Panicum subalbidum"))

# Set formulas
Syntax <- set_formula(Syntax, Veg, formula_id="KAI4",
		formula="groups:'Cyperus difformis' & !groups:'Cyperus latifolius'")
Syntax <- set_formula(Syntax, Veg, formula_id="KAI5",
		formula="groups:'Cyperus difformis' & !(species:'Leersia hexandra > 25' | species:'Cyperus latifolius > 25')")

# Check content
validObject(Syntax)
summary(Syntax)
summary(Syntax, Veg)

# Classify
Veg@header <- make_cocktail(Syntax, Veg, cover="percen")
summary(as.factor(Veg@header$Syntax))
