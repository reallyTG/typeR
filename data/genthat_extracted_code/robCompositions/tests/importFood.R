# # import Swiss food data
# 
# library("readxl")
# nutrients <- read_excel("~/workspace/Swiss_Food_Comp_Data_V5.2-red.xlsx", skip = 2)
# dim(nutrients)
# nutrients$unit <- factor(nutrients$unit)
# nutrients$I <- nutrients$I / 1000
# nutrients$category_D <- factor(nutrients$category_D)
# nutrients$category_F <- factor(nutrients$category_F)
# nutrients$category_I <- factor(nutrients$category_I)
# nutrients$category_E <- factor(nutrients$category_E)
# nutrients <- nutrients[1:965, ]
# save(nutrients, file = "~/workspace/robCompositions/data/nutrients.rda", compress = "xz")
# 
# nutrients_branded <- read_excel("~/workspace/Swiss_Food_Comp_Data_V5.2-red.xlsx", skip = 2, 
#                       sheet = "Branded Foods")
# nutrients_branded <- nutrients_branded[1:9618,]
# nutrients_branded$`category D` <- factor(nutrients_branded$`category D`)
# nutrients_branded$`category F` <- factor(nutrients_branded$`category F`)
# nutrients_branded$`category I` <- factor(nutrients_branded$`category I`)
# nutrients_branded$`category E` <- factor(nutrients_branded$`category E`)
# nutrients_branded$`matrix unit` <- factor(nutrients_branded$`matrix unit`)
# nutrients_branded$Na <- nutrients_branded$Na / 1000
# colnames(nutrients_branded) <- c("name_D", "category_D", "category_F", "category_I",
#                                  "category_E", "gravity", "energy_kJ", "energy_kcal",
#                                  "protein", "alcohol", "water", "carbohydrates_available",
#                                  "sugars", "dietary_fibres", "fat_total", "fatty_acids_saturated",
#                                  "Na", "unit") 
# save(nutrients_branded, file = "~/workspace/robCompositions/data/nutrients_branded.rda", compress = "xz")
