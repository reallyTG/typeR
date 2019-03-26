library(forestmangr)


### Name: est_clutter
### Title: Estimate future and present basal area, volume, TCA, CMI and MMI
###   values of the Clutter Growth and Yield Model
### Aliases: est_clutter

### ** Examples


library(forestmangr)
data("exfm17")
exfm17

clutter <- fit_clutter(exfm17, "age", "DH", "B", "V", "S", "plot")
clutter

# Classify data into 3 classes:
ex_class <- classify_site(exfm17, "S", 3, "plot")
head(ex_class ,15)

# Estimate basal area using the average basal area as the initial basal area,
# volume,  Mean Monthly Increment (MMI) and Current Monthly Increment (CMI)
# values using Clutter's model:
est_clutter(ex_class,20:125, "B","S","category_",clutter,"average")

# For a more detailed output, including a plot, use output="full":
est_clutter(ex_class,20:125, "B","S","category_",clutter, output="full")

# Estimate basal area using an estimated basal area as the initial basal area:
est_clutter(ex_class,20:125,"B","S","category_",clutter,"model") 

# age can be a variable:
est_clutter(ex_class,"age","B","S","category_", clutter,"model")  
  



