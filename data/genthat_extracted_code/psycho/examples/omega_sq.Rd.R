library(psycho)


### Name: omega_sq
### Title: Partial Omega Squared.
### Aliases: omega_sq

### ** Examples

library(psycho)

df <- psycho::affective

x <- aov(df$Tolerating ~ df$Salary)
x <- aov(df$Tolerating ~ df$Salary * df$Sex)

omega_sq(x)



