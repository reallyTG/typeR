library(recipes)


### Name: names0
### Title: Naming Tools
### Aliases: names0 dummy_names
### Keywords: datagen

### ** Examples

names0(9, "x")
names0(10, "x")

example <- data.frame(y = ordered(letters[1:5]),
                      z = factor(LETTERS[1:5]))

dummy_names("z", levels(example$z)[-1])

after_mm <- colnames(model.matrix(~y, data = example))[-1]
after_mm
levels(example$y)

dummy_names("y", substring(after_mm, 2), ordinal = TRUE)



