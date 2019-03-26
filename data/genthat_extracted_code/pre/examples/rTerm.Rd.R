library(pre)


### Name: rTerm
### Title: Wrapper Functions for terms in gpe
### Aliases: rTerm lTerm eTerm

### ** Examples

mt <- terms(
~ rTerm(x1 < 0) + rTerm(x2 > 0) + lTerm(x3) + eTerm(x4), 
specials = c("rTerm", "lTerm", "eTerm"))
attr(mt, "specials")
# $rTerm
# [1] 1 2
# 
# $lTerm
# [1] 3
# 
# $eTerm
# [1] 4




