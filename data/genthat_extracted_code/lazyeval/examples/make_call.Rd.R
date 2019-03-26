library(lazyeval)


### Name: make_call
### Title: Make a call with 'lazy_dots' as arguments.
### Aliases: make_call

### ** Examples

make_call(quote(f), lazy_dots(x = 1, 2))
make_call(quote(f), list(x = 1, y = ~x))
make_call(quote(f), ~x)

# If no known or no common environment, fails back to baseenv()
make_call(quote(f), quote(x))



