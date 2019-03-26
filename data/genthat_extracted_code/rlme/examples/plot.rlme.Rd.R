library(rlme)


### Name: plot.rlme
### Title: Plot rlme Fit
### Aliases: plot.rlme

### ** Examples


data(schools)
rlme.fit = rlme(y ~ 1 + sex + age + (1 | region) + (1 | region:school), schools, method="gr")
plot(rlme.fit)




