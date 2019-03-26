library(rPref)


### Name: psel
### Title: Preference Selection
### Aliases: peval psel psel.indices

### ** Examples


# Skyline and top-k/at-least skyline
psel(mtcars, low(mpg) * low(hp))
psel(mtcars, low(mpg) * low(hp), top = 5)
psel(mtcars, low(mpg) * low(hp), at_least = 5)

# preference with associated data frame and evaluation
p <- low(mpg, df = mtcars) * (high(cyl) & high(gear))
peval(p)

# visualize the skyline in a plot
sky1 <- psel(mtcars, high(mpg) * high(hp))
plot(mtcars$mpg, mtcars$hp)
points(sky1$mpg, sky1$hp, lwd=3)

# grouped preference with dplyr
library(dplyr)
psel(group_by(mtcars, cyl), low(mpg))

# return size of each maxima group
summarise(psel(group_by(mtcars, cyl), low(mpg)), n())




