library(vcdExtra)


### Name: cutfac
### Title: Cut a Numeric Variable to a Factor
### Aliases: cutfac
### Keywords: manip

### ** Examples

if (require(AER)) {
data("NMES1988", package="AER")
nmes <- NMES1988[, c(1, 6:8, 13, 15, 18)]

plot(log(visits+1) ~ cutfac(chronic), data = nmes,
  ylab = "Physician office visits (log scale)", 
  xlab = "Number of chronic conditions", main = "chronic")

plot(log(visits+1) ~ cutfac(hospital, c(0:2, 8)), data = nmes,
  ylab = "Physician office visits (log scale)", 
  xlab = "Number of hospital stays", main = "hospital")
}






