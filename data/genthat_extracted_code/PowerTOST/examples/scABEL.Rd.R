library(PowerTOST)


### Name: scABEL
### Title: Scaled (widened) BE Acceptance Limits
### Aliases: scABEL

### ** Examples

scABEL(CV=0.3, regulator="EMA")
# should give the usual BE limits:
# lower  upper
#  0.80   1.25
scABEL(CV=0.4, regulator="EMA")
# should give the widened limits:
#   lower     upper
# 0.746177 1.340165
#
# define old ANVISA settings via reg_const()
rc <- reg_const("USER", r_const=0.76, CVswitch=0.4, CVcap=0.5)
rc$name <- "ANVISAold"
scABEL(CV=0.4, regulator=rc)
# should give the not widened limits:
# lower upper 
#  0.80  1.25 



