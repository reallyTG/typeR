library(vcdExtra)


### Name: update.xtabs
### Title: Update method for a 'xtabs' object
### Aliases: update.xtabs
### Keywords: models

### ** Examples

vietnam.tab <- xtabs(Freq ~ sex + year + response, data=Vietnam)

update(vietnam.tab, formula = ~ . -year)





