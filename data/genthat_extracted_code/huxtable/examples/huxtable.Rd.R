library(huxtable)


### Name: huxtable
### Title: Create a huxtable
### Aliases: huxtable hux tribble_hux

### ** Examples

ht <- huxtable(
        column1 = 1:5,
        column2 = letters[1:5]
      )
ht
tribble_hux(
  ~ Name,             ~ Salary,
    "John Smith",       50000,
    "Jane Doe",         50000,
    "David Hugh-Jones", 50000,
    add_colnames = TRUE
)



