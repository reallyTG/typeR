library(lmomco)


### Name: TLmoms
### Title: The Sample Trimmed L-moments and L-moment Ratios
### Aliases: TLmoms
### Keywords: L-moment (sample) L-moment (trimmed sample)

### ** Examples

X1 <- rcauchy(30)
TL <- TLmoms(X1,nmom=6,trim=1)

# This trimming with remove the 1 and the two 4s. All values passed on to the TLmom()
# function then are equal and number of L-moments is too big as well. TLmom() returns
# NaN but these are intercepted and systematically changed to NAs.
TLmoms(c(1,2,2,2,4,4), leftrim=1, rightrim=2, nmom=6)$lambdas
# [1]  2  0  0 NA NA NA

# Example of zero skewness (Berry Boessenkool)
TLmoms(c(3.2, 4.4, 4.8, 2.6, 3.6))



