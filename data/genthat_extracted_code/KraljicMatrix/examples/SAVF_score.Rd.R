library(KraljicMatrix)


### Name: SAVF_score
### Title: Single attribute value function
### Aliases: SAVF_score

### ** Examples


# The single attribute x is bounded between 1 and 5 and follows an exponential
# utility curve with rho = .653

x <- runif(10, 1, 5)
x
## [1] 2.964853 1.963182 1.223949 1.562025 4.381467 2.286030 3.071066
## [8] 4.470875 3.920913 4.314907

SAVF_score(x, x_low = 1, x_high = 5, rho = .653)
## [1] 0.7800556 0.5038275 0.1468234 0.3315217 0.9605856 0.6131944 0.8001003
## [8] 0.9673124 0.9189685 0.9553165




