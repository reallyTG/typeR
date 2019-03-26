library(coala)


### Name: locus_trio
### Title: Locus Trios
### Aliases: locus_trio

### ** Examples

# A model with one locus trio
coal_model(25) +
  locus_trio(locus_length=c(1250, 1017, 980), distance=c(257, 814))

# Ten identical locus trios:
coal_model(25) +
  locus_trio(locus_length=c(1250, 1017, 980), distance=c(257, 814), number = 10)

# Two different ones:
coal_model(25) +
  locus_trio(locus_length=c(1000, 500, 900), distance=c(200, 400)) +
  locus_trio(locus_length=c(700, 500, 800), distance=c(350, 150))



