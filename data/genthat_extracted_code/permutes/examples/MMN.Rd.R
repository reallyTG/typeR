library(permutes)


### Name: MMN
### Title: EEG data from Jager (in prep.). See the vignette for details.
### Aliases: MMN
### Keywords: datasets

### ** Examples

## No test: 
# Run permutation tests on all electrodes and timepoints, reporting p-values for the three
# manipulated factors
perms <- permu.test(cbind(Fp1,AF3,F7,F3,FC1,FC5,C3,CP1,CP5,P7,P3,Pz,PO3,O1,Oz,O2,PO4,P4,P8,CP6,CP2,
                                     C4,FC6,FC2,F4,F8,AF4,Fp2,Fz,Cz) ~ dev*session | time,data=MMN)

# Run the tests in parallel on two CPU threads
# first, set up the parallel backend
library(doParallel)
cl <- makeCluster(2)
registerDoParallel(cl)
perms <- permu.test(cbind(Fp1,AF3,F7,F3,FC1,FC5,C3,CP1,CP5,P7,P3,Pz,PO3,O1,Oz,O2,PO4,P4,P8,CP6,CP2,
                       C4,FC6,FC2,F4,F8,AF4,Fp2,Fz,Cz) ~ dev*session | time,data=MMN,parallel=TRUE)

# Plot the results
plot(perms)
## End(No test)



