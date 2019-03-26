library(politicaldata)


### Name: cap_get_mip
### Title: Download the Comparative Agenda Project's dataset of responses
###   to Gallup's Most Important Problem question, coded by CAP major topic
### Aliases: cap_get_mip

### ** Examples



# pull the Most Important Problem data for every year since 1980
mip <- cap_get_mip(min_year = 1980)

# pull the MIP data for every year between 1950 and 1970
mip <- cap_get_mip(min_year = 1950, max_year = 1970)

# pull the MIP Data for every year until 2010
mip <- cap_get_mip(max_year = 2010)





