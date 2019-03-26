library(nlsem)


### Name: lav2nlsem
### Title: Create a structural equation model from lavaan syntax
### Aliases: lav2nlsem

### ** Examples

# create model with three latent classes
lav.model <- '
          class: 1
          eta =~ y1 + y2 + y3 + y4
          xi1 =~ x1 + x2 + x3 + x4 + x5
          xi2 =~ x6 + x7 + x8 + x9 + x10 + x11

          eta ~ xi1 + xi2 + xi1:xi1

          class: 2
          eta =~ y1 + y2 + y3 + y4
          xi1 =~ x1 + x2 + x3 + x4 + x5
          xi2 =~ x6 + x7 + x8 + x9 + x10 + x11

          eta ~ xi1 + xi2 + xi1:xi2 + xi1:xi1

          class: 3
          eta =~ y1 + y2 + y3 + y4
          xi1 =~ x1 + x2 + x3 + x4 + x5
          xi2 =~ x6 + x7 + x8 + x9 + x10 + x11

          eta ~ xi1 + xi2 + xi1:xi2'

model <- lav2nlsem(lav.model, constraints = "direct1", class.spec = "class")



