library(huxtable)


### Name: mapping-functions
### Title: How to set cell properties variably by cell contents
### Aliases: mapping-functions mapping_functions

### ** Examples

ht <- hux(c("OK", "Warning", "Error"))
ht <- map_text_color(ht, by_values(
        OK      = "green",
        Warning = "orange",
        Error   = "red"
      ))
ht

# Leaving NA values alone:
map_text_color(ht, by_values(
      "OK" = "blue", NA, ignore_na = TRUE))

# Resetting values:
map_text_color(ht, by_values(
      "OK" = "blue", NA, ignore_na = FALSE))

ht <- hux(rnorm(5), rnorm(5), rnorm(5))
map_background_color(ht, by_ranges(
        c(-1, 1),
        c("blue", "yellow", "red")
      ))
map_background_color(ht,
      by_equal_groups(2, c("red", "green")))

ht <- hux(
        Coef = c(3.5, 2.4, 1.3),
        Pval = c(0.04, 0.01, 0.07),
        add_colnames = TRUE
      )
map_bold(ht, everywhere, "Pval",
      by_ranges(0.05, c(TRUE, FALSE)))

# Problems with as.matrix:

ht <- hux(c(-1, 1, 2), letters[1:3])
as.matrix(ht)          # look at the spaces...
as.matrix(ht) > 0      # uh oh
map_text_color(ht,
      by_cases(. < 0 ~ "red", TRUE ~ "blue"))

# To avoid this, only look at the truly numeric columns:
map_text_color(ht, row = 1:3, col = 1,
      by_cases(. < 0 ~ "red", TRUE ~ "blue"))



