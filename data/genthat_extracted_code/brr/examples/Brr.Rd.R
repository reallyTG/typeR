library(brr)


### Name: Brr
### Title: Creation and summary of a 'brr' object
### Aliases: Brr print.summary.brr summary.brr

### ** Examples

model <- Brr(a=2, b=3)
model()
# add parameters
model <- model(c=4, d=5)
model()
# replace parameters
model <- model(a=10, b=11)
model()
model <- Brr()
summary(model)
model <- Brr(x=3, y=4)
summary(model)
model <- Brr(a=2, b=4, T=10)
summary(model)
model <- model(a=2, b=4, c=3, d=5, S=10, T=10)
summary(model)
model <- model(x=5, y=10)
summary(model)



