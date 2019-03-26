library(xoi)


### Name: simStahl
### Title: Simulate crossover locations under the Stahl model
### Aliases: simStahl
### Keywords: datagen

### ** Examples


# simulations with no interference, chromosome of length 80 cM
xoNI <- simStahl(100, nu=1, p=0, L=80)

# simulations under gamma model with nu=7.6
xogamma <- simStahl(100, nu=7.6, p=0, L=80)

# simulations under Stahl model with nu=7.6, p=0.1
xostahl <- simStahl(100, nu=7.6, p=0.1, L=80)

# simulations under chi-square model with nu=11 (m=10) and obligate chiasma
xo_oblchi <- simStahl(100, nu=11, p=0, L=80, obligate_chiasma=TRUE)

# simulations under Stahl model with nu=11, p=0.1, and obligate chiasma
xo_oblchi_stahl <- simStahl(100, nu=11, p=0.1, L=80, obligate_chiasma=TRUE)



