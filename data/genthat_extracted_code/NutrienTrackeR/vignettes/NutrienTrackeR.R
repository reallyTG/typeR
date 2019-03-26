## ----setup, echo=FALSE---------------------------------------------------
knitr::opts_chunk$set(message=FALSE, fig.path='figures/')

## ----tidy = TRUE, eval = FALSE-------------------------------------------
#  install.packages("NutrienTrackeR")

## ----tidy = TRUE, eval = TRUE--------------------------------------------
library(NutrienTrackeR)

## ----tidy = TRUE---------------------------------------------------------
# USDA dataset
USDA_dataset <- food_composition_data$USDA

# CIQUAL dataset
CIQUAL_dataset <- food_composition_data$CIQUAL

# BEDCA dataset
BEDCA_dataset <- food_composition_data$BEDCA

## ----tidy = TRUE---------------------------------------------------------
# Get nutrients included in the USDA dataset
nutrients_USDA <- getNutrientNames(food_database = "USDA")
print(head(nutrients_USDA), 4)

## ----tidy = TRUE, tidy.opts=list(indent = 2, width.cutoff = 150)---------
# Top 2 high-protein CIQUAL foods
subsetFoodRichIn(nutrient_name = "Protein (g)", food_database = "CIQUAL", n = 2)[, "food_name"]

# Top 3 high-protein BEDCA foods within "Fruits and fruit products"
subsetFoodRichIn(nutrient_name = "Protein (g)", food_database = "BEDCA", food_group = "Fruits and fruit products", n = 3)[, "food_name"]


## ----tidy = TRUE, tidy.opts=list(indent = 2, width.cutoff = 150)---------
# Find the USDA food name "Tomatoes, green, raw"
findFoodName(keywords = c("Tomato", "raw"), food_database = "USDA")

## ----tidy = TRUE, tidy.opts=list(indent = 2, width.cutoff = 150)---------
# Foods eaten in day 1
head(sample_diet_USDA[[1]])

## ----tidy = TRUE, tidy.opts=list(indent = 2, width.cutoff = 50), message = TRUE----
# Calculate nutrient intake
daily_intake <- dietBalance(my_daily_food = sample_diet_USDA, food_database = "USDA", 
                           age = 27, gender = "female")

## ----tidy = TRUE, results='asis', fig.pos = "center"---------------------
nutrientIntakePlot(daily_intake)

## ----tidy = TRUE, tidy.opts=list(indent = 2, width.cutoff = 180), results='asis', fig.pos = "center",  fig.width = 20, fig.height = 10----
#Load ggplott2
library(ggplot2)

## Generate plot
q <- nutrientPiePlot(daily_intake, nutrient_name = "Magnesium, Mg (mg)")

## Adjust font size
q + theme(axis.title = element_text(size = 29), axis.text = element_text(size = 29), legend.title = element_text(size = 22),legend.text = element_text(size = 20))

## ----tidy = TRUE, tidy.opts=list(indent = 2, width.cutoff = 180), results='asis', fig.pos = "center",  fig.width = 12, fig.height = 6----
# Generate plot
p <- nutrientsTimeTrend(my_daily_food = sample_diet_USDA, food_database = "USDA", 
                        nutrients = c("Calcium, Ca (mg)", "Iron, Fe (mg)"))

# Adjust font size
p + theme(axis.title = element_text(size = 18), axis.text = element_text(size = 16), legend.title = element_text(size = 18),legend.text = element_text(size = 18))

