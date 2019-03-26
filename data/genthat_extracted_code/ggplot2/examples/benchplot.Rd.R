library(ggplot2)


### Name: benchplot
### Title: Benchmark plot creation time. Broken down into construct, build,
###   render and draw times.
### Aliases: benchplot
### Keywords: internal

### ** Examples

benchplot(ggplot(mtcars, aes(mpg, wt)) + geom_point())
benchplot(ggplot(mtcars, aes(mpg, wt)) + geom_point() + facet_grid(. ~ cyl))

# With tidy eval:
p <- expr(ggplot(mtcars, aes(mpg, wt)) + geom_point())
benchplot(!!p)



