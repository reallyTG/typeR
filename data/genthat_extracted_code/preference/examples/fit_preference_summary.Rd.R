library(preference)


### Name: fit_preference_summary
### Title: Fit Preference Model from Summary Data
### Aliases: fit_preference_summary

### ** Examples

# Unstratified

x1mean <- 5
x1var <- 1
m1 <- 15
x2mean <- 7
x2var <- 1.1
m2 <- 35
y1mean <- 6
y1var <- 1
n1 <- 25
y2mean <- 8
y2var <- 1.2
n2 <- 25
fit_preference_summary(x1mean, x2var, m1, x2mean, x2var, m2, y1mean, y1var,
               n1, y2mean, y2var, n2)

# Stratified

x1mean <- c(5, 3)
x1var <- c(1, 1)
m1 <- c(15, 30)
x2mean <- c(7, 7)
x2var <- c(1.1, 3.1)
m2 <- c(35, 40)
y1mean <- c(6, 4)
y1var <- c(1, 2)
n1 <- c(25, 35)
y2mean <- c(8, 12)
y2var <- c(1.2, 1)
n2 <- c(25, 20)
fit_preference_summary(x1mean, x2var, m1, x2mean, x2var, m2, y1mean, y1var,
                       n1, y2mean, y2var, n2, alpha=0.1)



