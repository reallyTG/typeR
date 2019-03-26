library(expss)


### Name: mrset
### Title: Create multiple response set/multiple dichotomy set from
###   variables
### Aliases: mrset mdset mrset_f mdset_f mrset_p mdset_p

### ** Examples

data(product_test)

calc_cro_cpct(product_test, mrset(a1_1 %to% a1_6))

# same result
calc_cro_cpct(product_test, mrset_f(a1_))

# same result
calc_cro_cpct(product_test, mrset_p("a1_"))



