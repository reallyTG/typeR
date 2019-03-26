library(rcdd)


### Name: lpcdd
### Title: linear programming with exact arithmetic
### Aliases: lpcdd
### Keywords: misc

### ** Examples

# first two rows are inequalities, second two equalities
hrep <- rbind(c("0", "0", "1", "1", "0", "0"),
              c("0", "0", "0", "2", "0", "0"),
              c("1", "3", "0", "-1", "0", "0"),
              c("1", "9/2", "0", "0", "-1", "-1"))
a <- c("2", "3/5", "0", "0")
lpcdd(hrep, a)

# primal inconsistent problem
hrep <- rbind(c("0", "0", "1", "0"),
              c("0", "0", "0", "1"),
              c("0", "-2", "-1", "-1"))
a <- c("1", "1")
lpcdd(hrep, a)

# dual inconsistent problem
hrep <- rbind(c("0", "0", "1", "0"),
              c("0", "0", "0", "1"))
a <- c("1", "1")
lpcdd(hrep, a, minimize = FALSE)



