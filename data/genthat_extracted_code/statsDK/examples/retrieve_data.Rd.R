library(statsDK)


### Name: retrieve_data
### Title: Retrieves a specific table from Statistics Denmark
### Aliases: retrieve_data

### ** Examples


metadata <- statsDK::retrieve_metadata("FOLK1A")
dplyr::glimpse(metadata)

# See the variables as a data frame
variables <- statsDK::get_variables(metadata)
dplyr::glimpse(variables)

# Use the param and the settings columns from the variables data to set the
# rigth values for the API call.
df_en <- statsDK::retrieve_data("PRIS111", VAREGR = "000000", ENHED = "*",
                                Tid = paste(paste0("2017M0", 1:8), collapse = ","))
dplyr::glimpse(df_en)

df_da <- statsDK::retrieve_data("PRIS111", VAREGR = "000000", ENHED = "*",
                                Tid = paste(paste0("2017M0", 1:8), collapse = ","),
                                lang = "da")
dplyr::glimpse(df_da)



