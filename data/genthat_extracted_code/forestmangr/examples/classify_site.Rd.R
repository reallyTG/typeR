library(forestmangr)


### Name: classify_site
### Title: Classify inventory data based on site index
### Aliases: classify_site

### ** Examples


library(forestmangr)
data("exfm17")
exfm17

# Classify data into 3 classes:
ex_class <- classify_site(exfm17, "S", 3, "plot")
head(ex_class ,15)




