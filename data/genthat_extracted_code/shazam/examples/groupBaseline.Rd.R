library(shazam)


### Name: groupBaseline
### Title: Group BASELINe PDFs
### Aliases: groupBaseline

### ** Examples

 
## No test: 
# Subset example data from alakazam
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
                         
# Group PDFs by sample
grouped1 <- groupBaseline(baseline, groupBy="SAMPLE")
sample_colors <- c("-1h"="steelblue", "+7d"="firebrick")
plotBaselineDensity(grouped1, idColumn="SAMPLE", colorValues=sample_colors, 
                    sigmaLimits=c(-1, 1))
 
# Group PDFs by both sample (between variable) and isotype (within variable)
grouped2 <- groupBaseline(baseline, groupBy=c("SAMPLE", "ISOTYPE"))
isotype_colors <- c("IgM"="darkorchid", "IgD"="firebrick", 
                    "IgG"="seagreen", "IgA"="steelblue")
plotBaselineDensity(grouped2, idColumn="SAMPLE", groupColumn="ISOTYPE",
                    colorElement="group", colorValues=isotype_colors,
                    sigmaLimits=c(-1, 1))

# Collapse previous isotype (within variable) grouped PDFs into sample PDFs
grouped3 <- groupBaseline(grouped2, groupBy="SAMPLE")
sample_colors <- c("-1h"="steelblue", "+7d"="firebrick")
plotBaselineDensity(grouped3, idColumn="SAMPLE", colorValues=sample_colors,
                    sigmaLimits=c(-1, 1))
## End(No test)



