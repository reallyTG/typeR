library(zFactor)


### Name: z.Shell
### Title: Shell correlation from Kumar thesis (2005)
### Aliases: z.Shell

### ** Examples

# single z point and create a dataframe with info
ppr <- 1.5
tpr <- 1.1
z.calc <- z.Shell(pres.pr = ppr, temp.pr = tpr)
# From the Standing-Katz chart we obtain a digitized point:
z.chart <- getStandingKatzMatrix(tpr_vector = tpr,
                                 pprRange = "lp")[1, as.character(ppr)]
ape <- abs((z.calc - z.chart) / z.chart) * 100
df <- as.data.frame(list(Ppr = ppr,  z.calc =z.calc, z.chart = z.chart, ape=ape))
rownames(df) <- tpr
df



