library(popEpi)


### Name: as.aggre
### Title: Coercion to Class 'aggre'
### Aliases: as.aggre as.aggre.data.frame as.aggre.data.table
###   as.aggre.default

### ** Examples

library("data.table")
df <- data.frame(sex = rep(c("male", "female"), each = 5), 
                 obs = rpois(10, rep(7,5, each=5)), 
                 pyrs = rpois(10, lambda = 10000))
dt <- as.data.table(df)

df <- as.aggre(df, values = c("pyrs", "obs"), by = "sex")
dt <- as.aggre(dt, values = c("pyrs", "obs"), by = "sex")

class(df)
class(dt)

BL <- list(fot = 0:5)
df <- data.frame(df)
df <- as.aggre(df, values = c("pyrs", "obs"), by = "sex", breaks = BL)




