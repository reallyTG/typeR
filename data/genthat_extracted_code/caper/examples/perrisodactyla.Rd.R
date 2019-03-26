library(caper)


### Name: perissodactyla
### Title: Example dataset for the CAIC package
### Aliases: perissodactyla perissodactyla.data perissodactyla.tree
### Keywords: datasets

### ** Examples

data(perissodactyla)
# default behaviour is to omit incomplete data rows
(perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial))
# but this can be turned off
(perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial, na.omit=FALSE))
na.omit(perisso)



