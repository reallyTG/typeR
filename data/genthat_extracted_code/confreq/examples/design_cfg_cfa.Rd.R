library(confreq)


### Name: design_cfg_cfa
### Title: Designmatrix for log linear CFA models
### Aliases: design_cfg_cfa

### ** Examples

#######################################
# designmatrix with three main effects.
# three variables with two categories each.
design_cfg_cfa(kat=c(2,2,2))
# two variables with two categories each and one variable
# with 7 categories (Lienert LSD example).
design_cfg_cfa(kat=c(2,2,7))
###########
# designmatrix with three main effects an three interactions.
# three variables with two categories each.
design_cfg_cfa(kat=c(2,2,2),form="~ V1 + V2 + V3 + V1:V2 + V1:V3 + V2:V3")
# two variables with two categories each and one variable
# with 7 categories (Lienert LSD example).
design_cfg_cfa(kat=c(2,2,7),form="~ V1 + V2 + V3 + V1:V2 + V1:V3 + V2:V3")
#######################################



