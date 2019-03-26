library(Zelig)


### Name: qi_slimmer
### Title: Find the median and a central interval of simulated quantity of
###   interest distributions
### Aliases: qi_slimmer

### ** Examples

library(dplyr)
qi.central.interval <- zelig(Petal.Width ~ Petal.Length + Species,
             data = iris, model = "ls") %>%
             setx(Petal.Length = 2:4, Species = "setosa") %>%
             sim() %>%
             zelig_qi_to_df() %>%
             qi_slimmer()




