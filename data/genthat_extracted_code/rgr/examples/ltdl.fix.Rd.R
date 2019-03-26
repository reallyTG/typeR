library(rgr)


### Name: ltdl.fix
### Title: Replace Negative Values Representing Less Than Detects in a
###   Vector
### Aliases: ltdl.fix
### Keywords: misc

### ** Examples

## Replace any missing data coded as -9999 with NAs and any remaining
## negative values representing less than detects with Abs(value)/2
data(fix.test)
x.fixed <- ltdl.fix(fix.test[, 3], coded = -9999)
x.fixed

## As above, and replace any zero values with NAs
x.fixed <- ltdl.fix(fix.test[, 3], coded = -9999, zero2na = TRUE)
x.fixed

## As above, but replace any negative values with NAs
x.fixed <- ltdl.fix(fix.test[, 3], negs2na = TRUE, coded = -9999, zero2na = TRUE)
x.fixed

## Make test data kola.o available, setting a -9999, indicating a
## missing pH measurement, to NA
data(kola.o)
attach(kola.o)
pH.fixed <- ltdl.fix(pH, coded = -9999)

## Display relationship between pH in one pH unit intervals and Cu in 
## O-horizon (humus) soil, extending the whiskers to the 2nd and 98th
## percentiles, finally removing the temporary data vector pH.fixed
bwplots(split(Cu,trunc(pH.fixed+0.5)), log = TRUE, wend = 0.02, 
	xlab = "Soil pH to the nearest pH unit",
	ylab = "Cu (mg/kg) in < 2 mm Kola O-horizon soil")
rm(pH.fixed)

## Or directly
bwplots(split(Cu,trunc(ltdl.fix(pH, coded = -9999)+0.5)), log = TRUE,  
	wend = 0.02, xlab = "Soil pH to the nearest pH unit",
	ylab = "Cu (mg/kg) in < 2 mm Kola O-horizon soil")

## Clean-up and detach test data
rm(x)
rm(x.fixed)
rm(pH.fixed)
detach(kola.o)



