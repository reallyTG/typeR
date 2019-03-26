library(Zelig)


### Name: setx
### Title: Setting Explanatory Variable Values
### Aliases: setx
### Keywords: file

### ** Examples

# Unconditional prediction:
data(turnout)
z.out <- zelig(vote ~ race + educate, model = 'logit', data = turnout)
x.out <- setx(z.out)
s.out <- sim(z.out, x = x.out)




