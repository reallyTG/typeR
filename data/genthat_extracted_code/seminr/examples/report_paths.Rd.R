library(seminr)


### Name: report_paths
### Title: Functions for reporting the Path Coefficients and R2 of
###   endogenous constructs and for generating a scatterplot matrix of
###   construct scores.
### Aliases: report_paths plot_scores

### ** Examples

data(mobi)

# seminr syntax for creating measurement model
mobi_mm <- constructs(
  composite("Image",        multi_items("IMAG", 1:5)),
  composite("Expectation",  multi_items("CUEX", 1:3)),
  composite("Value",        multi_items("PERV", 1:2)),
  composite("Satisfaction", multi_items("CUSA", 1:3))
)

#  structural model: note that name of the interactions construct should be
#  the names of its two main constructs joined by a '.' in between.
mobi_sm <- relationships(
  paths(to = "Satisfaction",
        from = c("Image", "Expectation", "Value"))
)

mobi_pls <- estimate_pls(mobi, measurement_model = mobi_mm, structural_model = mobi_sm)
report_paths(mobi_pls)
plot_scores(mobi_pls)




