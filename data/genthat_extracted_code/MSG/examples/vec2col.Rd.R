library(MSG)


### Name: vec2col
### Title: Generate colors from a vector
### Aliases: vec2col vec2col.default vec2col.factor

### ** Examples

## convert factor to colors
with(iris, plot(Petal.Length, Petal.Width, col = vec2col(Species), pch = 19))

# another palette
with(iris, plot(Petal.Length, Petal.Width, col = vec2col(Species, name = "Dark2"), 
    pch = 19))

## turn numeric values to colors
with(iris, plot(Petal.Length, Petal.Width, col = vec2col(Petal.Width), pch = 19))



