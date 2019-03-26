library(sets)


### Name: plot
### Title: Plot functions for generalized sets
### Aliases: plot.gset plot.set plot.cset plot.tuple plot.charfun_generator
###   lines.gset lines.set lines.cset lines.tuple lines.charfun_generator
### Keywords: math

### ** Examples

## basic plots
plot(gset(1:3, 1:3/3))
plot(gset(1:3, 1:3/3, universe = 0:4))
plot(gset(c("a", "b"), list(1:2/2, 0.3)))

## characteristic functions
plot(fuzzy_normal)
plot(tuple(fuzzy_normal, fuzzy_bell), col = 1:2)
plot(fuzzy_pi3_gset(min = 2, max = 15))

## superposing plots using lines()
x <- fuzzy_normal_gset()
y <- fuzzy_trapezoid_gset(corners = c(5, 10, 15, 17), height = c(0.7, 1))
plot(tuple(x, y))
lines(x | y, col = 2)
lines(x & y, col = 3)

## another example using gset_mean
x <- fuzzy_two_normals_gset(sd = c(2, 1))
y <- fuzzy_trapezoid_gset(corners = c(5, 9, 11, 15))
plot(tuple(x, y))
lines(tuple(gset_mean(x, y),
            gset_mean(x, y, "geometric"),
            gset_mean(x, y, "harmonic")),
      col = 2:4)

## creating a sequence of sets
plot(fuzzy_tuple(fuzzy_cone, 10), col = gray.colors(10))



