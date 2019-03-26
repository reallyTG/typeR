library(PowerTOST)


### Encoding: UTF-8

### Name: CVwRfromU
### Title: CVwR from the upper expanded limit (ABEL)
### Aliases: CVwRfromU U2CVwR

### ** Examples

# Given the upper expanded limit and using the defaults
CVwRfromU(U=1.38)
# should give [1] 0.44355, i.e., a CVwR ~ 44%
# Upper limit from a study according the Health Canada’s rules
CVwRfromU(U=1.48, regulator="HC")
# should give [1] 0.55214



