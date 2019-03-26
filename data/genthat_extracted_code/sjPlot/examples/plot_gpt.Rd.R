library(sjPlot)


### Name: plot_gpt
### Title: Plot grouped proportional tables
### Aliases: plot_gpt

### ** Examples

data(efc)

# the proportion of dependency levels in female
# elderly, for each family carer's relationship
# to elderly
plot_gpt(efc, e42dep, e16sex, e15relat)

# proportion of educational levels in highest
# dependency category of elderly, for different
# care levels
plot_gpt(efc, c172code, e42dep, n4pstu)




