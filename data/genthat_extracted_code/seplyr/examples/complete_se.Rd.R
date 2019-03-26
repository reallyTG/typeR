library(seplyr)


### Name: complete_se
### Title: complete by standard interface
### Aliases: complete_se

### ** Examples

# data frame used to illustrate tidyr::complete()
library(dplyr, warn.conflicts = FALSE)
library(tidyr) # for nesting()
df <- tibble(
group = c(1:2, 1),
item_id = c(1:2, 2),
item_name = c("a", "b", "b"),
value1 = 1:3,
value2 = 4:6)

# columns to complete by
col_terms <- c("group", "item_id", "item_name")
df %.>% complete_se(., col_terms)
df %.>% complete_se(., col_terms, fill = list(value1 = 0))

# with nesting
col_terms <- c("group", "nesting(item_id, item_name)")
df %.>% complete_se(., col_terms)
df %.>% complete_se(., col_terms, fill = list(value1 = 0))
df %.>% complete_se(., col_terms, fill = list(value1 = 0, value2 = 0))




