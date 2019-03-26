library(freqweights)


### Name: evaldp
### Title: Eval a manip function using a string
### Aliases: evaldp

### ** Examples

library(dplyr)
iris %>% evaldp(arrange,"Sepal.Length") %>%
         evaldp(filter, "Sepal.Length > 5, Species=='virginica'")



