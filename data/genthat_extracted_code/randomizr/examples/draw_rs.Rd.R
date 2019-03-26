library(randomizr)


### Name: draw_rs
### Title: Draw a random sample
### Aliases: draw_rs

### ** Examples

declaration <- declare_rs(N = 100, n = 30)
S <- draw_rs(declaration = declaration)
table(S)

# equivalent to
S <- draw_rs(N = 100, n = 30)
table(S)




