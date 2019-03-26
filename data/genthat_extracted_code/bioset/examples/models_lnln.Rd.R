library(bioset)


### Name: models_lnln
### Title: Model functions for data requiring ln-ln-transformation to fit a
###   model.
### Aliases: models_lnln fit_lnln plot_lnln interpolate_lnln

### ** Examples

# generate data
x <- c(2.718282, 20.085537, 54.598150, 1096.633158)
# x is known for these values
y_known <- c(33.11545, 665.14163, 2980.95799, 268337.28652)
# we will calculate x for those:
y_unknown <- c(148.4132, 13359.7268, 59874.1417)

model <- fit_lnln(x = x, y = y_known)
model

plot_lnln(x = x, y = y_known)

interpolate_lnln(y = y_unknown, model)

rm(x, y_known, y_unknown, model)




