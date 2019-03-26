library(PowerTOST)


### Name: reg_const
### Title: Constructor of an object with class 'regSet' containing the
###   regulatory settings for ABEL
### Aliases: reg_const

### ** Examples

# to retrieve the EMA settings
reg_const("EMA")
# to define the old ANVISA settings
reg <- reg_const("USER", r_const=0.76, CVswitch=0.4, CVcap=0.5)
reg$name <- "Old ANVISA"
# Use reg as argument in the power / sample size functions



