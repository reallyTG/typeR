library(safetyGraphics)


### Name: eDISH
### Title: Create an eDISH widget
### Aliases: eDISH

### ** Examples

## Not run: 
##D 
##D ## Create eDISH figure customized to user data
##D eDISH(data=adlbc, 
##D       id_col = "USUBJID",
##D       value_col = "AVAL", 
##D       measure_col = "PARAM", 
##D       visit_col = "VISIT",
##D       visitn_col = "VISITNUM", 
##D       studyday_col = "ADY",
##D       normal_col_low = "A1LO", 
##D       normal_col_high = "A1HI", 
##D       measure_values = list(ALT = "Alanine Aminotransferase (U/L)",
##D                             AST = "Aspartate Aminotransferase (U/L)",
##D                             TB = "Bilirubin (umol/L)",
##D                             ALP = "Alkaline Phosphatase (U/L)"))
##D 
##D ## Create eDISH figure using a premade settings list
##D group_cols_list <- list(
##D   list(value_col = "TRTP", label = "Treatment"),
##D   list(value_col = "SEX", label = "Sex"), 
##D   list(value_col = "AGEGR1", label = "Age group")
##D )
##D 
##D 
##D filters_list <- list(
##D   list(value_col = "TRTA", label = "Treatment"),
##D   list(value_col = "SEX", label = "Sex"), 
##D   list(value_col = "RACE", label = "RACE"),
##D   list(value_col = "AGEGR1", label = "Age group")
##D )
##D 
##D settingsl <- list(id_col = "USUBJID",
##D       value_col = "AVAL", 
##D       measure_col = "PARAM", 
##D       visit_col = "VISIT",
##D       visitn_col = "VISITNUM",
##D       studyday_col = "ADY", 
##D       normal_col_low = "A1LO", 
##D       normal_col_high = "A1HI", 
##D       group_cols = group_cols_list,
##D       filters = filters_list,
##D       measure_values = list(ALT = "Alanine Aminotransferase (U/L)",
##D                             AST = "Aspartate Aminotransferase (U/L)",
##D                             TB = "Bilirubin (umol/L)",
##D                             ALP = "Alkaline Phosphatase (U/L)"))
##D eDISH(data=adlbc, settings = settingsl)
##D 
## End(Not run)




