library(PKPDmisc)


### Name: replace_values
### Title: replace symbols or other character flags
### Aliases: replace_values

### ** Examples

df <- data.frame(ID = 1, DV = c(1, "BQL", ".", 5))
rflags <- data.frame(flag = c("BQL", "."), replacement = -99)
df$DVR <- replace_values(df$DV, rflags)

library(dplyr)
df <- df %>% mutate(DVR2 = replace_values(DV, rflags))

# powerful with unique_non_numerics
df <- df %>% mutate(DVR3 = replace_values(DV, 
                                 data.frame(values = unique_non_numerics(DV), 
                                            replacement = NA)))



