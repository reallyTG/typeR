library(psycho)


### Name: refdata
### Title: Create a reference grid.
### Aliases: refdata

### ** Examples

library(psycho)

df <- psycho::affective
newdata <- refdata(df, target = "Sex")
newdata <- refdata(df, target = "Sex", factors = "combinations")
newdata <- refdata(df, target = c("Sex", "Salary", "Tolerating"), length.out = 3)
newdata <- refdata(df, target = c("Sex", "Salary", "Tolerating"), numerics = 0)



