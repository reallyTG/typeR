library(flextable)


### Name: display
### Title: Define flextable displayed values
### Aliases: display

### ** Examples

library(officer)
# Formatting data values example ------
ft <- flextable(head( mtcars, n = 10))
ft <- display(ft, col_key = "carb",
  i = ~ drat > 3.5, pattern = "# {{carb}}",
  formatters = list(carb ~ sprintf("%.1f", carb)),
  fprops = list(carb = fp_text(color="orange") ) )
## No test: 
ft <- autofit(ft)
## End(No test)



