library(fastR2)


### Name: Corn
### Title: Corn Yield
### Aliases: Corn
### Keywords: datasets

### ** Examples


Corn2 <- stack(Corn)
names(Corn2) <- c('yield','treatment')
lm(yield ~ treatment, data = Corn2)
t.test(yield ~ treatment, data = Corn2)
t.test(Corn$reg, Corn$kiln)




