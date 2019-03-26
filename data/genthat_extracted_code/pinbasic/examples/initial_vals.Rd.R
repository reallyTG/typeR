library(pinbasic)


### Name: initial_vals
### Title: Initial values for PIN optimization
### Aliases: initial_vals

### ** Examples

# Loading simulated datasets

data("BSinfrequent")
data("BSfrequent")
data("BSheavy")

# Grid Search

grid <- initial_vals(numbuys = BSinfrequent[,"Buys"],
                     numsells = BSinfrequent[,"Sells"],
                     method = "Grid")

# Grid Search: Detailed Output

grid_detailed <- initial_vals(numbuys = BSinfrequent[,"Buys"],
                              numsells = BSinfrequent[,"Sells"],
                              method = "Grid", details = TRUE)

# HAC

hac <- initial_vals(numbuys = BSfrequent[,"Buys"],
                    numsells = BSfrequent[,"Sells"],
                    method = "HAC")

# Refined HAC

hac_ref <- initial_vals(numbuys = BSheavy[,"Buys"],
                        numsells = BSheavy[,"Sells"],
                        method = "HAC_Ref")




