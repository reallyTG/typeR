library(lazyeval)


### Name: auto_name
### Title: Automatically name all components of a lazy dots.
### Aliases: auto_name
### Keywords: internal

### ** Examples

x <- lazy_dots(1 + 2, mean(mpg))
auto_name(x)

auto_name(list(~f, quote(x)))



