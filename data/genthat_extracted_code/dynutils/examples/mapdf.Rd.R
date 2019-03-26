library(dynutils)


### Name: mapdf
### Title: Apply a function to each row of a data frame
### Aliases: mapdf mapdf_lgl mapdf_chr mapdf_int mapdf_dbl mapdf_dfr
###   mapdf_dfc walkdf

### ** Examples

library(dplyr)

tib <- tibble(
  a = c(1, 2),
  b = list(log10, sqrt),
  c = c("parrot", "quest"),
  .object_class = list(c("myobject", "list"), c("yourobject", "list"))
)

# map over the rows using a function
tib %>% mapdf(class)

# or use an anonymous function
tib %>% mapdf(function(row) paste0(row$b(row$a), "_", row$c))

# or a formula
tib %>% mapdf(~ .$b)

# there are many more variations available
# see ?mapdf for more info
tib %>% mapdf_lgl(~ .$a > 1)
tib %>% mapdf_chr(~ paste0("~", .$c, "~"))
tib %>% mapdf_int(~ nchar(.$c))
tib %>% mapdf_dbl(~ .$a * 1.234)



