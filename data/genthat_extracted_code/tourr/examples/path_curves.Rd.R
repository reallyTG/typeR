library(tourr)


### Name: path_curves
### Title: Draw the path that the geodesics took.
### Aliases: path_curves

### ** Examples

path1d <- save_history(flea[, 1:6], grand_tour(1), 10)
path2d <- save_history(flea[, 1:6], grand_tour(2), 10)

if (require("ggplot2")) {
plot(path_curves(path1d))
plot(path_curves(interpolate(path1d)))

plot(path_curves(path2d))
plot(path_curves(interpolate(path2d)))

# Instead of relying on the built in plot method, you might want to
# generate your own.  Here are few examples of alternative displays:

df <- path_curves(path2d)
qplot(step, value, data = df, group = obs:var, geom = "line", colour=var) + facet_wrap( ~ obs)

library(reshape2)
qplot(`1`, `2`, data = dcast(df, ... ~ var)) +
  facet_wrap( ~ step) +
  coord_equal()
}



