library(ipumsr)


### Name: lbl_collapse
### Title: Collapse labelled values to labels that already exist
### Aliases: lbl_collapse

### ** Examples

x <- haven::labelled(
  c(10, 10, 11, 20, 30, 99, 30, 10),
  c(Yes = 10, `Yes - Logically Assigned` = 11, No = 20, Maybe = 30, NIU = 99)
)

lbl_collapse(x, ~(.val %/% 10) * 10)
# Notice that 90 get's NIU from 99 even though 90 didn't have a label in original

lbl_collapse(x, ~ifelse(.lbl == 10, 11, .lbl))
# But here 10 is assigned 11's label

# You can also use the more explicit function notation
lbl_collapse(x, function(.val, .lbl) (.val %/% 10) * 10)

# Or even the name of a function
collapse_function <- function(.val, .lbl) (.val %/% 10) * 10
lbl_collapse(x, "collapse_function")




