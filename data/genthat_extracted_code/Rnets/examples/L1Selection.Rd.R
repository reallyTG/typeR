library(Rnets)


### Name: L1Selection
### Title: L1 Selection for Rnets
### Aliases: L1Selection

### ** Examples

## No test: 
 EC_all_L1Selection <- L1Selection(
                             x = NARMS_EC_DATA, 
                             L1_values = seq(0.05, 0.50, 0.05),
                             n_b = 1500,
                             v = ABX_LIST
                             )
print(EC_all_L1Selection)
## End(No test)



