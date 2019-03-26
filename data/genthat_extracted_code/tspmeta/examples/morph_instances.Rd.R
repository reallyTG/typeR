library(tspmeta)


### Name: morph_instances
### Title: Morphing (convex-combination) of two instances with parameter
###   alpha.
### Aliases: morph_instances

### ** Examples

x = random_instance(10)
y = random_instance(10)
z = morph_instances(x, y, 0.5)
autoplot(x)
autoplot(y)
autoplot(z)



