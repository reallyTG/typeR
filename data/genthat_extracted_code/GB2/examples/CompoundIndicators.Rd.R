library(GB2)


### Name: CompoundIndicators
### Title: Indicators of Poverty and Social Exclusion under the Compound
###   Distribution based on the GB2
### Aliases: CompoundIndicators arpt.cgb2 arpr.cgb2 rmpg.cgb2 qsr.cgb2
###   main.cgb2
### Keywords: distribution

### ** Examples

# GB2 parameters
a <- 3.9
b <- 18873
p <- 0.97
q <- 1.03

# Proportions defining the component densities
p0 <- rep(1/3,3)

# Mixture probabilities
pl <- c(0.39,0.26,0.35)

# for the right discretization
arpt <- arpt.cgb2(0.6, a, b, p, q, p0, pl)
arpr <- arpr.cgb2(0.6, a, p, q, p0, pl)
rmpg <- rmpg.cgb2(arpr, a, p, q, p0, pl)
qsr <- qsr.cgb2(a, p, q, p0, pl)

# for the left discretization
arptleft <- arpt.cgb2(0.6, a, b, p, q, p0, pl, "l")



