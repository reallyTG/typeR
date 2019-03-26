library(pcaPA)


### Name: Check.PA
### Title: Verifies that an object belongs to the '"PA"' class.
### Aliases: Check.PA
### Keywords: PA

### ** Examples


# # Run Parallel Analysis for binary data conforming to the Rasch model
data(simRaschData)
binaryRaschPA <- PA(simRaschData, percentiles = c(0.95, 0.99), nReplicates = 200,
                    type = "binary", algorithm = "polychoric")
print(binaryRaschPA)

# # Check if binaryRaschPA is a PA object
Check.PA(binaryRaschPA)  # Should return TRUE
Check.PA(simRaschData)  # Should return FALSE

# # Run Parallel Analysis for binary data conforming to the 2PL model
data(sim2plData)
binary2plPA <- PA(sim2plData, percentiles = c(0.95, 0.99), nReplicates = 200,
                  type = "binary", algorithm = "polychoric")
print(binary2plPA)

# # Check if binary2plPA is a PA object
Check.PA(binary2plPA)  # Should return TRUE
Check.PA(simRaschData)  # Should return FALSE




