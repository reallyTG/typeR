library(confreq)


### Name: confreq-package
### Title: Configural Frequencies Analysis Using Log-linear Modeling
### Aliases: confreq-package confreq

### ** Examples

#######################################
######### some examples ########
data(LienertLSD)
LienertLSD
CFA(LienertLSD)
## testing with (full) interactions
CFA(LienertLSD,form="~ C + T + A + C:T + C:A + T:A + C:T:A")
## testing the null model
CFA(LienertLSD,form="null")
#######################
data(suicide)
suicide
# suicide data is in non tabulated data representation 
# so it must be tabulated !
CFA(dat2fre(suicide))



