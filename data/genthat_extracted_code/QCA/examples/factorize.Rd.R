library(QCA)


### Name: factorize
### Title: Factorize Boolean expressions
### Aliases: factorize
### Keywords: functions

### ** Examples


# typical example with redundant conditions
factorize("AbcD + AbCd + AbCD + ABCd")

# results presented in alphabetical order
factorize("one*TWO*four + one*THREE + THREE*four")

# to preserve a certain order of the set names
factorize("one*TWO*four + one*THREE + THREE*four",
          snames = "ONE, TWO, THREE, FOUR")

factorize("~ONE*TWO*~FOUR + ~ONE*THREE + THREE*~FOUR",
          snames = "ONE, TWO, THREE, FOUR")

# using pos - products of sums
factorize("ac + aD + bc + bD", pos = TRUE)


# using an object of class "qca" produced with minimize()
data(CVF)
pCVF <- minimize(CVF, outcome = "PROTEST", incl.cut = 0.8,
                 include = "?", use.letters = TRUE)

factorize(pCVF)


# using an object of class "deMorgan" produced with negate()
factorize(negate(pCVF))





