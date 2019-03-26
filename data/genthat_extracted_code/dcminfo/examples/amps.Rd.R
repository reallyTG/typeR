library(dcminfo)


### Name: amps
### Title: Generate the possible attribute mastery profile
### Aliases: amps

### ** Examples


# Example 1.
simqmatrix <- sim_DINA_N1000$simqmatrix
simqmatrix
attr_mast_patt <- amps(q_matrix=simqmatrix)
attr_mast_patt

# Example 2.
ind_zero_probs <- c(3,7)
attr_mast_patt <- amps(q_matrix=simqmatrix, ind_zero_probs=ind_zero_probs)
attr_mast_patt





