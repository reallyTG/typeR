library(vanddraabe)


### Name: UniqueAtomHashes
### Title: Create Unique Atom Hashes
### Aliases: UniqueAtomHashes

### ** Examples

  ## Not run: 
##D   atoms.oi <- thrombin.1hai$atom[1:10, ]
##D   cols.oi <- c("elety", "resid", "chain", "resno")
##D   UniqueAtomHashes(atoms.oi, cols.oi, separator = "_")
##D   # [1] "N_THR_L_1"   "CA_THR_L_1"  "C_THR_L_1"   "O_THR_L_1"   "CB_THR_L_1"
##D   #     "OG1_THR_L_1" "CG2_THR_L_1" "N_PHE_L_1"   "CA_PHE_L_1"  "C_PHE_L_1"
##D 
##D   UniqueAtomHashes(atoms.oi, cols.oi, separator = "!")
##D   # The provided separator "!" is not acceptable. The default separator "_" is being used.
##D   #  [1] "N_THR_L_1"   "CA_THR_L_1"  "C_THR_L_1"   "O_THR_L_1"   "CB_THR_L_1"
##D   #      "OG1_THR_L_1" "CG2_THR_L_1" "N_PHE_L_1"   "CA_PHE_L_1"  "C_PHE_L_1"
##D   
## End(Not run)




