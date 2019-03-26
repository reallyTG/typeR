library(shazam)


### Name: summarizeBaseline
### Title: Calculate BASELINe summary statistics
### Aliases: summarizeBaseline

### ** Examples

## No test: 
# Subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgG")

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
                         nproc = 1)

# Grouping the PDFs by the sample annotation
grouped <- groupBaseline(baseline, groupBy="SAMPLE")

# Get a data.frame of the summary statistics
stats <- summarizeBaseline(grouped, returnType="df")
## End(No test)                     



