library(binMto)


### Name: apprPower
### Title: Approximate power (any rejection!) for many-to-one comparison of
###   binomial proportions
### Aliases: apprPower
### Keywords: htest

### ** Examples


# Recalculate the power of the Dunnett-contrast
# for the first setting in Bretz and Hothorn (2002, Table III),
# using a balanced design and the allocation rule n0/ni=sqrt(k)
# of Dunnett(1955), desiring a power of 80 percent.
# Note that differing from Bretz and Hothorn (2002)
# in the present function unpooled variance estimators
# are used, what might lead to different results.

apprPower(n=c(196, 196, 196, 196, 196),
 pH1=c(0.45, 0.45, 0.5, 0.5, 0.6),
 alpha=0.05, alternative="greater", method="Wald")

apprPower(n=c(294, 147, 147, 147, 147 ),
 pH1=c(0.45, 0.45, 0.5, 0.5, 0.6),
 alpha=0.05, alternative="greater", method="Wald")




