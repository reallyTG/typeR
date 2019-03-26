library(atlantistools)


### Name: get_groups
### Title: Collection of similar functions which get specific columns from
###   the Atlantis 'functionalGroups.csv'
### Aliases: get_groups get_age_groups get_acronyms get_age_acronyms
###   get_nonage_acronyms get_fish_acronyms

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")

get_age_groups(fgs)
get_nonage_acronyms(fgs)



