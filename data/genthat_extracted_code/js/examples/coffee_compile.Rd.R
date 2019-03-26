library(js)


### Name: coffee_compile
### Title: Coffee Script
### Aliases: coffee_compile coffee

### ** Examples

# Hello world
coffee_compile("square = (x) -> x * x")
coffee_compile("square = (x) -> x * x", bare = TRUE)

# Simple script
demo <- readLines(system.file("example/demo.coffee", package = "js"))
js <- coffee_compile(demo)
cat(js)
cat(uglify_optimize(js))



