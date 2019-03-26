library(mudata2)


### Name: parallel_gather
### Title: Melt multiple sets of columns in parallel
### Aliases: parallel_gather

### ** Examples

# gather paired value/error columns using
# parallel_gather
parallel_gather(pocmajsum, key = "param", 
                value = c(Ca, Ti, V), 
                sd = c(Ca_sd, Ti_sd, V_sd))

# identical result using only tidyverse functions
library(dplyr)      
library(tidyr)
gathered_values <- pocmajsum %>%
  select(core, depth, Ca, Ti, V) %>%
  gather(Ca, Ti, V, 
         key = "param", value = "value")
gathered_sds <- pocmajsum %>%
  select(core, depth, Ca_sd, Ti_sd, V_sd) %>%
  gather(Ca_sd, Ti_sd, V_sd, 
         key = "param_sd", value = "sd")

bind_cols(
  gathered_values,
  gathered_sds %>% select(sd)
)




