library(iemisc)


### Name: FgivenP
### Title: Future value given Present value (Engineering Economics)
### Aliases: FgivenP FgivenP FP

### ** Examples

library(iemisc)
# Example 4-3 from the Reference text (page 124)
FgivenP(8000, 4, 10, frequency = "annual") # the interest rate is 10%

FP(8000, 4, 10, frequency = "annual") # the interest rate is 10%


FgivenP(P = c(1000, 340, 23), n = c(12, 1.3, 3), i = c(10, 2, 0.3),
"annual")
# is is 10%, 2%, and 0.3%
# Can't use FP for this example


# Example 4-29 from the Reference text (page 165-166)
FgivenP(100, 10, 6, "quarter") # the interest rate is 6% per quarter

FP(100, 10, 6, "quarter") # the interest rate is 6% per quarter





