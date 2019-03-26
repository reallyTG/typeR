library(tidytidbits)


### Name: cross_tabulate
### Title: Create cross table from a tibble
### Aliases: cross_tabulate

### ** Examples

library(magrittr)
if (requireNamespace("survival", quietly = TRUE))
{
   survival::bladder1 %>%
      cross_tabulate(treatment, recur) %>%
      chisq.test()
}



