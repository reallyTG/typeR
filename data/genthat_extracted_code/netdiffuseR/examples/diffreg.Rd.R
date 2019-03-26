library(netdiffuseR)


### Name: diffreg
### Title: Diffusion regression model
### Aliases: diffreg

### ** Examples

data("medInnovationsDiffNet")

# Default model
ans <- diffreg(
  medInnovationsDiffNet ~ exposure + factor(city) + proage + per)
summary(ans)



