library(vcdExtra)


### Name: Abortion
### Title: Abortion Opinion Data
### Aliases: Abortion
### Keywords: datasets

### ** Examples

data(Abortion)

# example goes here
ftable(Abortion)
mosaic(Abortion, shade=TRUE)

# stratified by Sex
fourfold(aperm(Abortion, 3:1))
# stratified by Status
fourfold(aperm(Abortion, c(3,1,2)))




