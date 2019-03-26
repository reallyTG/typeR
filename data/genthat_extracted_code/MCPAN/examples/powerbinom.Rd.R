library(MCPAN)


### Name: powerbinom
### Title: Approximate power for multiple contrast tests of binomial
###   proportions.
### Aliases: powerbinom powerbinomOR
### Keywords: htest

### ** Examples


# Assume, one wants to perform a test for increasing trend
#  using Williams type of contrasts among I=5 groups
#  (e.g. 4 doses and one control).
#  Proportions are assumed to have values
#  pi=(0.1,0.12,0.14,0.14,0.2) under the alternative.

powerbinom(p=c(0.1, 0.12, 0.14, 0.14, 0.2),
 n=c(100,100,100,100,100), type = "Williams",
 alternative = "greater")

powerbinom(p=c(0.1, 0.12, 0.14, 0.14, 0.2),
 n=c(150,150,150,150,150), type = "Williams",
 alternative = "greater")

powerbinom(p=c(0.1, 0.12, 0.14, 0.14, 0.2),
 n=c(190,140,140,140,140), type = "Williams",
 alternative = "greater")


# probability to show for at least one group (2,3,4)
# a significant reduction versus control (1)

powerbinom(p=c(0.3, 0.15, 0.15, 0.15),
 n=c(140,140,140,140), type = "Dunnett",
 alternative = "less")

# probability to show for at least one group (2,3,4)
# a significant reduction versus control (1) of more 
# than 0.05 percent

powerbinom(p=c(0.3, 0.15, 0.15, 0.15),
 n=c(140,140,140,140), type = "Dunnett",
 alternative = "less", rhs=-0.05)

# probability to show for all groups (2,3,4)
# a significant reduction versus control (1) of more 
# than 0.05 percent

powerbinom(p=c(0.3, 0.15, 0.15, 0.15),
 n=c(140,140,140,140), type = "Dunnett",
 alternative = "less", rhs=-0.05, ptype="allpair")


# probability to show for at least one group (2,3,4)
# a significant reduction versus control (1)

powerbinom(p=c(0.3, 0.15, 0.15, 0.15),
 n=c(140,140,140,140), type = "Dunnett",
 alternative = "less")


powerbinomOR(p=c(0.3, 0.15, 0.15, 0.15),
 n=c(140,140,140,140), type = "Dunnett",
 alternative = "less")



