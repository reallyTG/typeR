library(survsup)


### Name: hcl_rainbow
### Title: Convenience function for the rainbow_hcl color scheme
### Aliases: hcl_rainbow

### ** Examples

library(survival)
library(dplyr)
veteran %>%
    survfit(Surv(time, status) ~ celltype, data = .) %>%
   plot_survfit(cuminc = FALSE) %>%
   hcl_rainbow()



