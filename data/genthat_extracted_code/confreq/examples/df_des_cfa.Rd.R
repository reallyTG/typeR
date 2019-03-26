library(confreq)


### Name: df_des_cfa
### Title: Degrees of freedom
### Aliases: df_des_cfa

### ** Examples

#######################################
# degrees of freedom for designmatrix with three main effects.
# three variables with two categories each.
df_des_cfa(design_cfg_cfa(kat=c(2,2,2)))
# two variables with two categories each and one variable
# with 7 categories (Lienert LSD example).
df_des_cfa(design_cfg_cfa(kat=c(2,2,7)))
###########
# degrees of freedom for designmatrix with three main effects
# and three 'two by two'interactions.
# and tripple interaction --> saturated model --> df=0
# three variables with two categories each.
df_des_cfa(design_cfg_cfa(kat=c(2,2,2),form="~ V1 + V2 + V3 + V1:V2 + V1:V3 + V2:V3 + V1:V2:V3"))
####################################### 



