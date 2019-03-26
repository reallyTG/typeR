library(geomorph)


### Name: combine.subsets
### Title: Combine separate landmark configurations
### Aliases: combine.subsets
### Keywords: utilities

### ** Examples

data(larvalMorph) 
head.gpa <- gpagen(larvalMorph$headcoords, curves = larvalMorph$head.sliders)
tail.gpa <- gpagen(larvalMorph$tailcoords, curves = larvalMorph$tail.sliders)
comb.lm <- combine.subsets(head = head.gpa, tail = tail.gpa, gpa = TRUE)
summary(comb.lm)
# Plot first specimen and color code landmarks 
# (configurations are actual relative size)
comb.lm$coords[,,1]
plot(comb.lm$coords[,,1], pch = 21, bg = c(rep(1,26), rep(2,64)), asp = 1)

# choose to override scaling by relative size 
comb.lm <- combine.subsets(head = head.gpa$coords, 
tail = tail.gpa$coords, gpa = FALSE, CS.sets = NULL)
summary(comb.lm)
plot(comb.lm$coords[,,1], pch = 21, bg = c(rep(1,26), rep(2,64)), asp = 1)



