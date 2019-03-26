library(hutils)


### Name: mutate_other
### Title: Group infrequent entries into 'Other category'
### Aliases: mutate_other

### ** Examples

library(data.table)
library(magrittr)

DT <- data.table(City = c("A", "A", "B", "B", "C", "D"),
                 value = c(1, 9, 4, 4, 5, 11))

DT %>%
  mutate_other("City", var.weight = "value", mass = 10) %>%
  .[]
  



