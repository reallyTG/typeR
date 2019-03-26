library(radiant.basics)


### Name: cross_tabs
### Title: Evaluate associations between categorical variables
### Aliases: cross_tabs

### ** Examples

cross_tabs(newspaper, "Income", "Newspaper") %>% str()
table(select(newspaper, Income, Newspaper)) %>% cross_tabs(tab = .)




