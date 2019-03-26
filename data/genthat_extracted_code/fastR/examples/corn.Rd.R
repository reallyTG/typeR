library(fastR)


### Name: corn
### Title: Corn Yield
### Aliases: corn
### Keywords: datasets

### ** Examples


corn2 <- stack(corn)
names(corn2) <- c('yield','treatment')
lm(yield ~ treatment, data = corn2)
t.test(yield ~ treatment, data=corn2)
t.test(corn$reg, corn$kiln)




