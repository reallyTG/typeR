library(ldat)


### Name: generate
### Title: Generate an lvec with (random) values
### Aliases: generate

### ** Examples

# generate an lvec with random normally distributed values with sd of 10
x <- generate(2E6, rnorm, sd = 10)
# generate lvec with random letters; use sample; expects n as its second
# argument, but we work around that by explicitly naming first argument x
y <- generate(2E6, sample, x = letters, replace = TRUE)




