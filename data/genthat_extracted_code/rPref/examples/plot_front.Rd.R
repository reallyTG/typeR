library(rPref)


### Name: plot_front
### Title: Pareto Front Plot
### Aliases: plot_front

### ** Examples


# plots Pareto fronts for the hp/mpg values of mtcars
show_front <- function(pref) {
  plot(mtcars$hp, mtcars$mpg)
  sky <- psel(mtcars, pref)
  plot_front(mtcars, pref, col = rgb(0, 0, 1))
  points(sky$hp, sky$mpg, lwd = 3)
}

# do this for all four combinations of Pareto compositions
show_front(low(hp)  * low(mpg))
show_front(low(hp)  * high(mpg))
show_front(high(hp) * low(mpg))
show_front(high(hp) * high(mpg))

# compare this to the front of a intersection preference
show_front(high(hp) | high(mpg))





