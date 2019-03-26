library(ipumsr)


### Name: lbl_na_if
### Title: Set labelled values to missing
### Aliases: lbl_na_if

### ** Examples

x <- haven::labelled(
  c(10, 10, 11, 20, 30, 99, 30, 10),
  c(Yes = 10, `Yes - Logically Assigned` = 11, No = 20, Maybe = 30, NIU = 99)
)

lbl_na_if(x, ~.val >= 90)
lbl_na_if(x, ~.lbl %in% c("Maybe"))
lbl_na_if(x, ~.val >= 90 | .lbl %in% c("Maybe"))

# You can also use the more explicit function notation
lbl_na_if(x, function(.val, .lbl) .val >= 90)

# Or even the name of a function
na_function <- function(.val, .lbl) .val >= 90
lbl_na_if(x, "na_function")




