library(psych)


### Name: factor.congruence
### Title: Coefficient of factor congruence
### Aliases: factor.congruence fa.congruence
### Keywords: multivariate models

### ** Examples

#factor congruence of factors and components, both rotated
#fa <- fa(Harman74.cor$cov,4)
#pc <- principal(Harman74.cor$cov,4)
#factor.congruence(fa,pc)
 #    RC1  RC3  RC2  RC4
#MR1 0.98 0.41 0.28 0.32
#MR3 0.35 0.96 0.41 0.31
#MR2 0.23 0.16 0.95 0.28
#MR4 0.28 0.38 0.36 0.98



#factor congruence without rotation
#fa <- fa(Harman74.cor$cov,4,rotate="none")
#pc <- principal(Harman74.cor$cov,4,rotate="none")
#factor.congruence(fa,pc)   #just show the beween method congruences
#     PC1   PC2   PC3   PC4
#MR1 1.00 -0.04 -0.06 -0.01
#MR2 0.15  0.97 -0.01 -0.15
#MR3 0.31  0.05  0.94  0.11
#MR4 0.07  0.21 -0.12  0.96

#factor.congruence(list(fa,pc))  #this shows the within method congruence as well

 #     MR1   MR2  MR3   MR4  PC1   PC2   PC3   PC4
#MR1  1.00  0.11 0.25  0.06 1.00 -0.04 -0.06 -0.01
#MR2  0.11  1.00 0.06  0.07 0.15  0.97 -0.01 -0.15
#MR3  0.25  0.06 1.00  0.01 0.31  0.05  0.94  0.11
#MR4  0.06  0.07 0.01  1.00 0.07  0.21 -0.12  0.96
#PC1  1.00  0.15 0.31  0.07 1.00  0.00  0.00  0.00
#PC2 -0.04  0.97 0.05  0.21 0.00  1.00  0.00  0.00
#PC3 -0.06 -0.01 0.94 -0.12 0.00  0.00  1.00  0.00
#PC4 -0.01 -0.15 0.11  0.96 0.00  0.00  0.00  1.00

#pa <- fa(Harman74.cor$cov,4,fm="pa")
# factor.congruence(fa,pa)
#         PA1  PA3  PA2  PA4
#Factor1 1.00 0.61 0.46 0.55
#Factor2 0.61 1.00 0.50 0.60
#Factor3 0.46 0.50 1.00 0.57
#Factor4 0.56 0.62 0.58 1.00


#compare with 
#round(cor(fa$loading,pc$loading),2)
#      RC1   RC3   RC2   RC4
#MR1  0.99 -0.18 -0.33 -0.34
#MR3 -0.33  0.96 -0.16 -0.43
#MR2 -0.29 -0.46  0.98 -0.21
#MR4 -0.44 -0.30 -0.22  0.98




