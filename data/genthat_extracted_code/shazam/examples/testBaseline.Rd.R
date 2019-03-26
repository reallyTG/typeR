library(shazam)


### Name: testBaseline
### Title: Two-sided test of BASELINe PDFs
### Aliases: testBaseline

### ** Examples

## No test: 
# Subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE %in% c("IgM", "IgG", "IgA"))

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

# Group PDFs by the isotype
grouped <- groupBaseline(baseline, groupBy="ISOTYPE")

# Visualize isotype PDFs
plot(grouped, "ISOTYPE")

# Perform test on isotype PDFs
testBaseline(grouped, groupBy="ISOTYPE")
## End(No test)



