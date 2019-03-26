library(survsup)


### Name: cat4
### Title: Convenience function for four-category color scheme
### Aliases: cat4

### ** Examples

library(survival)
library(dplyr)
veteran %>%
    survfit(Surv(time, status) ~ celltype, data = .) %>%
   plot_survfit(cuminc = FALSE) %>%
   cat4(reverse = TRUE)



