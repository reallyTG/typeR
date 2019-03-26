library(hedgehog)


### Name: generate
### Title: Compose generators
### Aliases: generate

### ** Examples

gen_squares   <- generate(for (i in gen.int(10)) i^2)
gen_sq_digits <- generate(for (i in gen_squares) {
  gen.c(of = i, gen.element(1:9))
})



