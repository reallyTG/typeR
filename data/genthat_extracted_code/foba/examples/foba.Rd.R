library(foba)


### Name: foba
### Title: Greedy variable selection for ridge regression
### Aliases: foba
### Keywords: regression models optimize

### ** Examples

data(boston)

model.foba <- foba(boston$x,boston$y,steps=20)
print(model.foba)

model.foba.a <- foba(boston$x,boston$y,type="foba.a",steps=20) # Can use abbreviations
print(model.foba.a)

model.for <- foba(boston$x,boston$y,type="for",steps=20) 
print(model.for)

model.back <- foba(boston$x,boston$y,type="back") # Use only first 20 variables
print(model.back)





