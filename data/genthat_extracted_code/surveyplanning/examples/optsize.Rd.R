library(surveyplanning)


### Name: optsize
### Title: Optimal sample size allocation
### Aliases: optsize
### Keywords: surveyplanning

### ** Examples


data <- data.table(H = 1 : 3,
                   s2h=10 * runif(3),
                   s2h2 = 10 * runif(3),
                   poph = 8 * 1 : 3,
                   Rh = rep(1, 3),
                   dd = c(1, 1, 1))

vars <- optsize(H = "H",
                s2h=c("s2h", "s2h2"),
                n = 10, poph = "poph",
                Rh = "Rh",
                fullsampleh = NULL, 
                dataset = data)
vars



