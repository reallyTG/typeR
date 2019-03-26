library(EngrExpt)


### Name: fish
### Title: Toxin concentrations in fish by site
### Aliases: fish fish2
### Keywords: datasets

### ** Examples

str(fish)
dotplot(reorder(site, toxin) ~ toxin, fish, jitter.y = TRUE,
        aspect = 0.3, xlab = "Amount of toxin (mg/kg wet weight)")
str(fish2)
dotplot(reorder(site, toxin) ~ toxin, fish2, jitter.y = TRUE,
        aspect = 0.3, xlab = "Amount of toxin (mg/kg wet weight)")



