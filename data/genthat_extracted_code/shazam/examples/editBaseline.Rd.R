library(shazam)


### Name: editBaseline
### Title: Edit the Baseline object
### Aliases: editBaseline

### ** Examples

## No test: 
# Subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgG" & SAMPLE == "+7d")

# Make Baseline object
baseline <- calcBaseline(db, 
                         sequenceColumn="SEQUENCE_IMGT",
                         germlineColumn="GERMLINE_IMGT_D_MASK", 
                         testStatistic="focused",
                         regionDefinition=IMGT_V,
                         targetingModel=HH_S5F,
                         nproc=1)
                         
# Edit the field "description"
baseline <- editBaseline(baseline, field="description", 
                         value="+7d IgG")
## End(No test)




