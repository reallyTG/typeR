library(rMEA)


### Name: plot.MEA
### Title: Plots an object of class 'MEA'
### Aliases: plot.MEA

### ** Examples

## read a single file
path_normal <- system.file("extdata/normal/200_01.txt", package = "rMEA")
mea_normal <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist", skip=1,
                     idOrder = c("id","session"), idSep="_")
mea_normal <- MEAccf(mea_normal, lagSec = 5, winSec = 30, incSec = 10, ABS = FALSE)
## Visual inspection of the data
plot(mea_normal[[1]], from = 60, to = "2:00")
plot(mea_normal[[1]], from = 0, duration = "5:00")

#' ## Visualize CCF inspection of the data
plot(mea_normal[[1]], from = 0, duration = "2:00", ccf = "lag_zero", rescale=TRUE)




