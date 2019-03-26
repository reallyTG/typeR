library(numform)


### Name: fv_percent_lead
### Title: Percent Difference
### Aliases: fv_percent_lead fv_percent_lead_fixed_relative
###   ffv_percent_lead ffv_percent_lead_fixed_relative

### ** Examples

set.seed(10)
x <- sample(1:10)

data.frame(
    original = x,
    perc_change = fv_percent_lead(x)
)

## Not run: 
##D library(dplyr)
##D 
##D CO2 %>%
##D     group_by(Plant) %>%
##D     mutate(
##D         `Percent` = fv_percent(conc),
##D         `Percent Diff` = fv_percent_diff(conc),
##D         `Percent Relative` = fv_percent_lead(conc)
##D     ) %>%
##D     print(n=Inf)
##D 
##D CO2 %>%
##D     group_by(Type, Treatment) %>%
##D     mutate(
##D         `Percent` = fv_percent(conc),
##D         `Percent Diff` = fv_percent_diff(conc),
##D         `Percent Relative` = fv_percent_lead(conc)
##D     ) %>%
##D     print(n=Inf)
## End(Not run)



