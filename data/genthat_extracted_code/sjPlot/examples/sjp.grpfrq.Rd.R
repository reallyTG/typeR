library(sjPlot)


### Name: sjp.grpfrq
### Title: Plot grouped or stacked frequencies
### Aliases: sjp.grpfrq

### ** Examples

data(efc)
sjp.grpfrq(efc$e17age, efc$e16sex, show.values = FALSE)

# boxplot
sjp.grpfrq(efc$e17age, efc$e42dep, type = "box")

# grouped bars
sjp.grpfrq(efc$e42dep, efc$e16sex, title = NULL)

# box plots with interaction variable
sjp.grpfrq(efc$e17age, efc$e42dep, intr.var = efc$e16sex, type = "box")

# Grouped bar plot
sjp.grpfrq(efc$neg_c_7, efc$e42dep, show.values = FALSE)

# same data as line plot
sjp.grpfrq(efc$neg_c_7, efc$e42dep, type = "line")




