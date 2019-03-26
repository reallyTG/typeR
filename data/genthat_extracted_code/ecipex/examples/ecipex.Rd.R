library(ecipex)


### Name: ecipex
### Title: Calculate fine structure isotope pattern
### Aliases: ecipex
### Keywords: fft fine isotope pattern structure

### ** Examples

# a simple molecule
iso_H2O <- ecipex("H2O")[[1]]
iso_H2O

# reduce limit for larger molecule and sort output by mass
iso_C254H338N65O75S6 <- ecipex("C254H338N65O75S6", limit=1e-8, sortby="mass")[[1]]
head(iso_C254H338N65O75S6)

# check that sum of all abundances is still close to 1
sum(iso_C254H338N65O75S6$abundance)

# inspect the full isotope pattern, the fine structure, and the full pattern on a log scale
par(mfrow=c(1,3))
plot(iso_C254H338N65O75S6, t="h")
plot(iso_C254H338N65O75S6, t="h", xlim=c(5691.29, 5691.31))
plot(iso_C254H338N65O75S6, t="h", log="y")

# calculate isotopic abundances with enriched Carbon-13
modifiediso <- nistiso 
modifiediso[modifiediso$element=="C",3] <- c(0.9, 0.1)
ecipex("C2", isoinfo=modifiediso)

# the isotope pattern can be calculated quickly if the elements only have 2 stable isotopes
system.time(iso_C10000H10000 <- ecipex("C10000H10000", limit=1e-8)[[1]])

# this is typically a more demanding calculation because S has 4 stable isotopes
system.time(iso_S50 <- ecipex("S50", limit=1e-8)[[1]])

# if the limit is greater than the most abundant isotopologue the output is uninformative
iso_C10000H10000_useless <- ecipex("C10000H10000", limit=0.015)

# calculate the isotope patterns of multiple formulas, and include the detailed isotopic composition
multisopatterns <- ecipex(c("H2O", "CO2", "O2", "C8H18", "C60"), sortby="mass", id=TRUE)

# inspect C8H18 in particular
multisopatterns$C8H18

# make sure all abundances are close to 1
sapply(multisopatterns, function(x){sum(x$abundance)})

# due to floating point errors, the following are not identical
iso_C60_almostComplete <- ecipex("C60", limit= 0)[[1]]
iso_C60_reallyComplete <- ecipex("C60", limit= -1)[[1]]
# the latter includes negative isotopic abundances because the floating point errors are orders of 
# magnitude greater than the "true" abundances. The variations in natural isotopic abundances will
# typically be much greater than floating point errors.



