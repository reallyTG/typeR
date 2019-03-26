library(PAutilities)


### Name: get_bmr
### Title: Retrieve estimated basal metabolic rate for an individual
### Aliases: get_bmr

### ** Examples


# Get BMR for an imaginary 900-year-old person (Age is only
# used to determine which equations to use, in this case the
# equations for someone older than 60)

get_bmr(
  Sex = "M", Ht = 1.5, Wt = 80, Age = 900, equation = "both",
  method = "both", RER = 0.865, kcal_table = "both",
  MJ_conversion = c("all")
)

get_bmr(
  Sex = "M", Ht = 1.5, Wt = 80, Age = 900, MJ_conversion = "all",
  kcal_conversion = 4.86
)

get_bmr(
  Sex = "M", Ht = 1.5, Wt = 80, Age = 900, method = "FAO",
  kcal_conversion = 4.86
)




