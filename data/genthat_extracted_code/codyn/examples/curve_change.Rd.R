library(codyn)


### Name: curve_change
### Title: Curve Change
### Aliases: curve_change

### ** Examples

data(pplots)
# Without replicates
df <- subset(pplots, plot == 25)
curve_change(df = df,
           species.var = "species",
           abundance.var = "relative_cover",
           time.var = "year")

# With replicates
df <- subset(pplots, year < 2004 & plot %in% c(6, 25, 32))
curve_change(df = df,
           species.var = "species",
           abundance.var = "relative_cover",
           replicate.var = "plot",
           time.var = "year")
           
# With reference year
df <- subset(pplots, year < 2005 & plot %in% c(6, 25, 32))
curve_change(df = df,
           species.var = "species",
           abundance.var = "relative_cover",
           replicate.var = "plot",
           time.var = "year",
           reference.time = 2002)



