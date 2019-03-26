library(staRdom)


### Name: eem_raman_normalisation2
### Title: Wrapper function to eem_raman_normalisation (eemR).
### Aliases: eem_raman_normalisation2

### ** Examples

data(eem_list)
# correction by blank
eems_bl <- eem_raman_normalisation2(eem_list,blank="blank")

# correction by value
eems_num <- eem_raman_normalisation2(eem_list,blank=168)



