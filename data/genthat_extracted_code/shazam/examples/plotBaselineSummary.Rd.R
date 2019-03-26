library(shazam)


### Name: plotBaselineSummary
### Title: Plots BASELINe summary statistics
### Aliases: plotBaselineSummary

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
 
# Grouping the PDFs by sample and isotype annotations
grouped <- groupBaseline(baseline, groupBy=c("SAMPLE", "ISOTYPE"))

# Plot mean and confidence interval by region with custom group colors
isotype_colors <- c("IgM"="darkorchid", "IgD"="firebrick", 
                    "IgG"="seagreen", "IgA"="steelblue")
plotBaselineSummary(grouped, "SAMPLE", "ISOTYPE", 
                    groupColors=isotype_colors)

# Facet by group instead of region
plotBaselineSummary(grouped, "SAMPLE", "ISOTYPE", facetBy="group")
## End(No test)




