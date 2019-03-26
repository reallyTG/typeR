library(hoa)


### Name: rabbits
### Title: Rabbits Data
### Aliases: rabbits
### Keywords: datasets

### ** Examples

data(rabbits)
attach(rabbits)
fc <- cured/(cured + died)
coplot(fc ~ log(penicil) | delay, data = rabbits)



