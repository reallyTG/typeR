library(polmineR)


### Name: tooltips
### Title: Add tooltips to text output.
### Aliases: tooltips tooltips,character-method tooltips,html-method
###   tooltips,kwic-method

### ** Examples

use("polmineR")

P <- partition("REUTERS", places = "argentina")
H <- html(P)
Y <- highlight(H, lightgreen = "higher")
T <- tooltips(Y, list(lightgreen = "Further information"))
if (interactive()) T

# Using the tooltips-method in a pipe ...
if (require("magrittr")){
  P %>%
    html() %>%
    highlight(yellow = c("barrels", "oil", "gas")) %>%
    tooltips(list(yellow = "energy"))
}



