library(mudata2)


### Name: mudata
### Title: Create a mudata object
### Aliases: mudata

### ** Examples

# use the data table from kentvillegreenwood as a template
kg_data <- tbl_data(kentvillegreenwood)
# create mudata object using just the data table
mudata(kg_data)

# create a mudata object starting from a parameter-wide data frame
library(tidyr)
library(dplyr)

# gather columns and summarise replicates
datatable <- pocmaj %>%
  gather(Ca, Ti, V, key = "param", value = "param_value") %>%
  group_by(core, param, depth) %>%
  summarise(value = mean(param_value), sd = mean(param_value)) %>%
  rename(location = core)

# create mudata object
mudata(datatable)




