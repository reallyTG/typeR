library(sjmisc)


### Name: has_na
### Title: Check if variables or cases have missing / infinite values
### Aliases: has_na incomplete_cases complete_cases complete_vars
###   incomplete_vars

### ** Examples

data(efc)
has_na(efc$e42dep)
has_na(efc, e42dep, tot_sc_e, c161sex)
has_na(efc)

has_na(efc, e42dep, tot_sc_e, c161sex, out = "index")
has_na(efc, out = "df")

has_na(efc, by = "row")
has_na(efc, e42dep, tot_sc_e, c161sex, by = "row", out = "index")
has_na(efc, by = "row", out = "df")

complete_cases(efc, e42dep, tot_sc_e, c161sex)
incomplete_cases(efc, e42dep, tot_sc_e, c161sex)
complete_vars(efc, e42dep, tot_sc_e, c161sex)
incomplete_vars(efc, e42dep, tot_sc_e, c161sex)




