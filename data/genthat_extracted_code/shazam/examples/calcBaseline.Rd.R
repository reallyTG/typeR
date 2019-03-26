library(shazam)


### Name: calcBaseline
### Title: Calculate the BASELINe PDFs
### Aliases: calcBaseline

### ** Examples

# Load and subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgG" & SAMPLE == "+7d")

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
                         



