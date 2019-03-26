library(scoper)


### Name: analyzeClones
### Title: Clonal assignment analysis
### Aliases: analyzeClones

### ** Examples

# Clonal assignment analysis
results <- analyzeClones(ClonedExampleDb, junction = "JUNCTION", v_call = "V_CALL",
                          j_call = "J_CALL", clone = "CLONE", first = TRUE)
# print threshold (a numeric)
results@threshold

# get inter and intra conal distances (a data.frame)
df <- results@inter_intra[[1]]

# density plot of inter versus intra clonal distances  (a ggplot).
results@plot_inter_intra

# get the neighborhoods used in spectral clustering (a numeric vector).
ngs <- results@neighborhoods

# plot histogram of neighborhoods (a ggplot).
results@plot_neighborhoods



