library(cna)


### Name: condTbl
### Title: Extract conditions and solutions from an object of class "cna"
### Aliases: condTbl print.condTbl as.condTbl condTbl msc asf csf

### ** Examples

# Crisp-set data from Lam and Ostrom (2010) on the impact of development interventions
# ------------------------------------------------------------------------------------
# CNA with causal ordering that corresponds to the ordering in Lam & Ostrom (2010); coverage 
# cut-off at 0.9 (consistency cut-off at 1).
cna.irrigate <- cna(d.irrigate, ordering = list(c("A","R","F","L","C"),"W"), cov = .9,
                    maxstep = c(4, 4, 12), details = TRUE)
cna.irrigate

# The previous function call yields a total of 12 complex solution formulas, only
# 5 of which are returned in the default output. 
# Here is how to extract all 12 complex solution formulas along with all 
# solution attributes.
csf(cna.irrigate)
# With only the standard attributes plus exhaustiveness and faithfulness.
csf(cna.irrigate, details = c("e", "f"))

# Extract all atomic solution formulas.
asf(cna.irrigate)

# Extract all minimally sufficient conditions.
msc(cna.irrigate)

# Extract only the conditions (solutions).
csf(cna.irrigate)$condition
asf(cna.irrigate)$condition
msc(cna.irrigate)$condition

# A CNA of d.irrigate without a presupposed ordering is even more ambiguous.
cna2.irrigate <- cna(d.irrigate, cov = .9, maxstep = c(4,4,12), details = TRUE)

# To speed up the construction of complex solution formulas, first extract atomic solutions
# and then feed these asf into csf.
cna2.irrigate.asf <- asf(cna2.irrigate)
# By default, at least 20 csf are generated.
## No test: 
csf(cna2.irrigate, asfx = cna2.irrigate.asf, details = FALSE)
## End(No test)
# Generate the first 191 csf.
## No test: 
csf(cna2.irrigate, asfx = cna2.irrigate.asf, 191, details = FALSE)
## End(No test)
# Also extract exhaustiveness scores.
## No test: 
csf(cna2.irrigate, asfx = cna2.irrigate.asf, 191, details = "e")
## End(No test)
# Generate all 684 csf.
## No test: 
csf(cna2.irrigate, asfx = cna2.irrigate.asf, 684)
## End(No test)

# Return solution attributes with 5 digits.
print(cna2.irrigate.asf, digits = 5)

# Another example to the same effect.
## No test: 
print(csf(cna(d.irrigate, ordering = list(c("A","R","F","L","C"),"W"), 
              maxstep = c(4, 4, 12), cov = 0.9)), digits = 5)
## End(No test)              

# Feed the outputs of msc, asf, and csf into the condition function to further inspect the 
# properties of minimally sufficient conditions and atomic and complex solution formulas.
condition(msc(cna.irrigate)$condition, d.irrigate)
condition(asf(cna.irrigate)$condition, d.irrigate)
condition(csf(cna.irrigate)$condition, d.irrigate)

# Reshape the output of the condition function in such a way as to make it identical to the
# output returned by msc, asf, and csf.
as.condTbl(condition(msc(cna.irrigate)$condition, d.irrigate))
as.condTbl(condition(asf(cna.irrigate)$condition, d.irrigate))
as.condTbl(condition(csf(cna.irrigate)$condition, d.irrigate))

condTbl(csf(cna.irrigate)$condition, d.irrigate) # Same as preceding line



