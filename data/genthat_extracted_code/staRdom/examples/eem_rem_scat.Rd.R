library(staRdom)


### Name: eem_rem_scat
### Title: Remove Raman and Rayleigh scattering in fluorescence data
### Aliases: eem_rem_scat

### ** Examples

data(eem_list)

remove_scatter <- c()
remove_scatter["raman1"] = TRUE
remove_scatter["raman2"] = TRUE
remove_scatter["rayleigh1"] = TRUE
remove_scatter["rayleigh2"] = TRUE
remove_scatter_width = c(15,10,16,12)

eem_rem_scat(eem_list,remove_scatter,remove_scatter_width)



