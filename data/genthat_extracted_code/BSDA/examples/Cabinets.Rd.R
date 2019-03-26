library(BSDA)


### Name: Cabinets
### Title: Estimates of costs of kitchen cabinets by two suppliers on 20
###   prospective homes
### Aliases: Cabinets
### Keywords: datasets

### ** Examples


DIF <- Cabinets$supplA - Cabinets$supplB
qqnorm(DIF)
qqline(DIF)
shapiro.test(DIF)
with(data = Cabinets, 
     t.test(supplA, supplB, paired = TRUE)
)
with(data = Cabinets,
     wilcox.test(supplA, supplB, paired = TRUE)
)
rm(DIF)




