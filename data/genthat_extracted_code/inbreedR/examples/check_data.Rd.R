library(inbreedR)


### Name: check_data
### Title: Checks the data for consistency with the inbreedR working
###   format.
### Aliases: check_data

### ** Examples

data(mouse_msats)
# tranform raw genotypes into 0/1 format
genotypes <- convert_raw(mouse_msats)
# check data
check_data(genotypes, num_ind = 36, num_loci = 12)





