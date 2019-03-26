library(codyn)


### Name: abundance_change
### Title: Species Abundance Changes
### Aliases: abundance_change

### ** Examples

data(pplots)
# Without replicates
df <- subset(pplots, plot == 25)
abundance_change(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 time.var = "year")

# With replicates
df <- subset(pplots, year < 2004 & plot %in% c(6, 25, 32))
abundance_change(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 replicate.var = "plot",
                 time.var = "year")
                 
# With reference year
df <- subset(pplots, year < 2005 & plot %in% c(6, 25, 32))
abundance_change(df = df,
                 species.var = "species",
                 abundance.var = "relative_cover",
                 replicate.var = "plot",
                 time.var = "year",
                 reference.time = 2002)



