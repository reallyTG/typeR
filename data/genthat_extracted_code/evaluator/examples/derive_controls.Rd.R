library(evaluator)


### Name: derive_controls
### Title: Derive control difficulty parameters for a given qualitative
###   scenario
### Aliases: derive_controls

### ** Examples

data(capabilities)
capability_ids <- c("1, 3")
mappings <- data.frame(type = "diff", label = "1 - Immature", l = 0, ml = 2, h = 10,
                       conf = 3, stringsAsFactors = FALSE)
derive_controls(capability_ids, capabilities, mappings)



