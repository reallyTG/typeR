library(codyn)


### Name: curve_difference
### Title: Curve Difference
### Aliases: curve_difference

### ** Examples

data(pplots)
# With block and no time
df <- subset(pplots, year == 2002 & block < 3)
curve_difference(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 treatment.var = "treatment",
                 block.var = "block",
                 replicate.var = "plot")
                 
# With blocks and time
df <- subset(pplots, year < 2004 & block < 3)
curve_difference(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 treatment.var = "treatment",
                 block.var = "block",
                 replicate.var = "plot",
                 time.var = "year")

# With blocks, time, and reference treatment
df <- subset(pplots, year < 2004 & block < 3)
curve_difference(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 treatment.var = "treatment",
                 block.var = "block",
                 replicate.var = "plot",
                 time.var = "year",
                 reference.treatment = "N1P0")

# Pooling by treatment with time
df <- subset(pplots, year < 2004)
curve_difference(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 treatment.var = "treatment",
                 pool = TRUE,
                 replicate.var = "plot",
                 time.var = "year")

# All pairwise replicates with treatment
df <- subset(pplots, year < 2004 & plot %in% c(21, 25, 32))
curve_difference(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 replicate.var = "plot",
                 time.var = "year",
                 treatment.var = "treatment")

# All pairwise replicates without treatment
df <- subset(pplots, year < 2004 & plot %in% c(21, 25, 32))
curve_difference(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 replicate.var = "plot",
                 time.var = "year")



