library(vcd)


### Name: Punishment
### Title: Corporal Punishment Data
### Aliases: Punishment
### Keywords: datasets

### ** Examples

data("Punishment", package = "vcd")
pun <- xtabs(Freq ~ memory + attitude + age + education, data = Punishment)

## model: ~ (memory + attitude) * age * education
## use maximum sum-of-squares test/shading
cotabplot(~ memory + attitude | age + education, data = pun, panel = cotab_coindep,
  n = 5000, type = "assoc", test = "maxchisq", interpolate = 1:2)



