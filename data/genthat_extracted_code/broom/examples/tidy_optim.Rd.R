library(broom)


### Name: tidy_optim
### Title: Tidy a(n) optim object masquerading as list
### Aliases: tidy_optim optim_tidiers tidy.optim

### ** Examples


func <- function(x) {
    (x[1] - 2)^2 + (x[2] - 3)^2 + (x[3] - 8)^2
}

o <- optim(c(1, 1, 1), func)

tidy(o)
glance(o)




