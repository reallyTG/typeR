library(rMEA)


### Name: lines.MEA
### Title: Adds lines of a 'MEA' object to a Plot
### Aliases: lines.MEA

### ** Examples

## read a single file
path_normal <- system.file("extdata/normal/200_01.txt", package = "rMEA")
mea_normal <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist", skip=1,
                     idOrder = c("id","session"), idSep="_")
mea_normal <- MEAccf(mea_normal, lagSec = 5, winSec = 30, incSec = 10, ABS = FALSE)
mea_smoothed <- MEAsmooth(mea_normal)
## Visual inspection of the data
plot(mea_normal[[1]], from = 240, duration=20)
lines(mea_smoothed[[1]], from = 240, duration=20, lty=3, col=c(1,2))



