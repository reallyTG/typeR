library(ezplot)


### Name: side_plot
### Title: side_plot
### Aliases: side_plot

### ** Examples

side_plot(mtcars, "gear", "1")
side_plot(mtcars, "cyl", c("Cars with <120 HP" = "hp < 120"))
side_plot(mtcars, "cyl", c(count = "ifelse(cyl == 4, 1, -1)", "hp <= 120"))
side_plot(mtcars, "cyl", c("hp <= 120", "~ - wt / cyl"))
side_plot(mtcars, "cyl", c("1", "-1"))



