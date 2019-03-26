library(ReliabilityTheory)


### Name: computeSystemSurvivalSignature
### Title: Compute the survival signature of a system
### Aliases: computeSystemSurvivalSignature
### Keywords: system survival signature

### ** Examples

## EXAMPLE 1
## Figure 1 in Coolen and Coolen-Maturi (2012)

# First, define the structure, ensuring that each physically separate component
# is separately numbered
fig1 <- graph.formula(s -- 1 -- 2:3 -- 4 -- 5:6 -- t, 2 -- 5, 3 -- 6)

# Second, create a vertex attribute specifying the type of each of those
# numbered component (leaving s,t with no type)
V(fig1)$compType <- NA # This just creates the attribute compType
V(fig1)$compType[match(c("1","2","5"), V(fig1)$name)] <- "Type 1"
V(fig1)$compType[match(c("3","4","6"), V(fig1)$name)] <- "Type 2"
V(fig1)$compType[match(c("s","t"), V(fig1)$name)] <- NA

# Third, compute the survival signature (getting fractions rather than decimals)
computeSystemSurvivalSignature(fig1, frac=TRUE)



## EXAMPLE 2
## Figure 3 in Coolen et al (2013)

# First, define the structure, ensuring that each physically separate component
# is separately numbered
fig3 <- graph.formula(s -- 1:4 -- 2:5 -- 3:6 -- t, s -- 7:8, 8 -- 9, 7:9 -- t)

# Second, create a vertex attribute specifying the type of each of those
# numbered component (leaving s,t with no type)
V(fig3)$compType <- NA # This just creates the attribute compType
V(fig3)$compType[match(c("1"), V(fig3)$name)] <- "Type 1"
V(fig3)$compType[match(c("2","3","4","7"), V(fig3)$name)] <- "Type 2"
V(fig3)$compType[match(c("5","6","8","9"), V(fig3)$name)] <- "Type 3"
V(fig3)$compType[match(c("s","t"), V(fig3)$name)] <- NA
  
# Third, compute the survival signature (getting fractions rather than decimals)
computeSystemSurvivalSignature(fig3, frac=TRUE)



