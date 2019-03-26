library(shazam)


### Name: plotBaselineDensity
### Title: Plots BASELINe probability density functions
### Aliases: plotBaselineDensity

### ** Examples

## No test: 
# Subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE %in% c("IgM", "IgG"))

# Collapse clones
db <- collapseClones(db, sequenceColumn="SEQUENCE_IMGT",
                     germlineColumn="GERMLINE_IMGT_D_MASK",
                     method="thresholdedFreq", minimumFrequency=0.6,
                     includeAmbiguous=FALSE, breakTiesStochastic=FALSE)
                     
# Calculate BASELINe
baseline <- calcBaseline(db, 
                         sequenceColumn="CLONAL_SEQUENCE",
                         germlineColumn="CLONAL_GERMLINE", 
                         testStatistic="focused",
                         regionDefinition=IMGT_V,
                         targetingModel=HH_S5F,
                         nproc=1)
 
# Grouping the PDFs by the sample and isotype annotations
grouped <- groupBaseline(baseline, groupBy=c("SAMPLE", "ISOTYPE"))

# Plot density faceted by region with custom isotype colors
isotype_colors <- c("IgM"="darkorchid", "IgD"="firebrick", 
                    "IgG"="seagreen", "IgA"="steelblue")
plotBaselineDensity(grouped, "SAMPLE", "ISOTYPE", colorValues=isotype_colors, 
                    colorElement="group", sigmaLimits=c(-1, 1))

# Facet by isotype instead of region
sample_colors <- c("-1h"="steelblue", "+7d"="firebrick")
plotBaselineDensity(grouped, "SAMPLE", "ISOTYPE", facetBy="group",
                    colorValues=sample_colors, sigmaLimits=c(-1, 1))
## End(No test)




