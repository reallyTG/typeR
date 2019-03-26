library(iemisc)


### Name: AgivenP
### Title: Annual value given Present value (Engineering Economics)
### Aliases: AgivenP AgivenP AP

### ** Examples

library(iemisc)
# Example for equation 4-14 from the Reference text (page 136)
AgivenP(17000, 4, 1, "annual")
# the interest rate is 1% per month and n is 4 months

AP(17000, 4, 1, "annual")
# the interest rate is 1% per month and n is 4 months


# Example 4-30 from the Reference text (page 166)
AgivenP(10000, 5, 12, "month")
# the interest rate is 12% compounded monthly for 5 years

AP(10000, 5, 12, "month")
# the interest rate is 12% compounded monthly for 5 years






