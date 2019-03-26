## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Load example data
library(shazam)
data(ExampleDb, package="alakazam")

## ---- eval=TRUE, warning=FALSE, results="hide"---------------------------
# Collapse clonal groups into single sequences
clones <- collapseClones(ExampleDb, regionDefinition=IMGT_V, 
                         method="thresholdedFreq", minimumFrequency=0.6,
                         includeAmbiguous=FALSE, breakTiesStochastic=FALSE, 
                         nproc=1)

## ---- eval=TRUE, warning=FALSE, results="hide"---------------------------
# Count observed mutations and append MU_COUNT columns to the output
observed <- observedMutations(clones, 
                              sequenceColumn="CLONAL_SEQUENCE",
                              germlineColumn="CLONAL_GERMLINE",
                              regionDefinition=IMGT_V, nproc=1)
# Count expected mutations and append MU_EXPECTED columns to the output
expected <- expectedMutations(observed, 
                              sequenceColumn="CLONAL_SEQUENCE",
                              germlineColumn="CLONAL_GERMLINE",
                              targetingModel=HH_S5F,
                              regionDefinition=IMGT_V, nproc=1)

## ---- eval=TRUE, warning=FALSE, results="hide"---------------------------
# Calculate selection scores using the output from expectedMutations
baseline <- calcBaseline(expected, testStatistic="focused", 
                         regionDefinition=IMGT_V, nproc=1)

## ---- eval=TRUE, warning=FALSE, results="hide"---------------------------
# Calculate selection scores from scratch
baseline <- calcBaseline(clones, testStatistic="focused", 
                         regionDefinition=IMGT_V, nproc=1)

## ---- eval=FALSE, warning=FALSE, results="hide"--------------------------
#  # Calculate selection on charge class with the mouse 5-mer model
#  baseline <- calcBaseline(clones, testStatistic="focused",
#                           regionDefinition=IMGT_V,
#                           targetingModel=MK_RS5NF,
#                           mutationDefinition=CHARGE_MUTATIONS,
#                           nproc=1)

## ---- eval=TRUE, warning=FALSE, results="hide"---------------------------
# Combine selection scores by time-point
grouped_1 <- groupBaseline(baseline, groupBy="SAMPLE")

## ---- eval=TRUE, warning=FALSE, results="hide"---------------------------
# Subset the original data to switched isotypes
db_sub <- subset(ExampleDb, ISOTYPE %in% c("IgM", "IgG"))

# Collapse clonal groups into single sequence
clones_sub <- collapseClones(db_sub, regionDefinition=IMGT_V, 
                             method="thresholdedFreq", minimumFrequency=0.6,
                             includeAmbiguous=FALSE, breakTiesStochastic=FALSE, 
                             nproc=1)

# Calculate selection scores from scratch
baseline_sub <- calcBaseline(clones_sub, testStatistic="focused", 
                             regionDefinition=IMGT_V, nproc=1)

# Combine selection scores by time-point and isotype
grouped_2 <- groupBaseline(baseline_sub, groupBy=c("SAMPLE", "ISOTYPE"))

## ---- eval=FALSE, warning=FALSE, results="hide"--------------------------
#  # First group by subject and status
#  subject_grouped <- groupBaseline(baseline, groupBy=c("STATUS", "SUBJECT"))
#  
#  # Then group the output by status
#  status_grouped <- groupBaseline(subject_grouped, groupBy="STATUS")

## ---- eval=TRUE----------------------------------------------------------
testBaseline(grouped_1, groupBy="SAMPLE")

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Set sample and isotype colors
sample_colors <- c("-1h"="seagreen", "+7d"="steelblue")
isotype_colors <- c("IgM"="darkorchid", "IgD"="firebrick", 
                    "IgG"="seagreen", "IgA"="steelblue")

# Plot mean and confidence interval by time-point
plotBaselineSummary(grouped_1, "SAMPLE")

# Plot selection scores by time-point and isotype for only CDR
plotBaselineSummary(grouped_2, "SAMPLE", "ISOTYPE", groupColors=isotype_colors,
                    subsetRegions="CDR")

# Group by CDR/FWR and facet by isotype
plotBaselineSummary(grouped_2, "SAMPLE", "ISOTYPE", facetBy="group")

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Plot selection PDFs for a subset of the data
plotBaselineDensity(grouped_2, "ISOTYPE", groupColumn="SAMPLE", colorElement="group", 
                    colorValues=sample_colors, sigmaLimits=c(-1, 1))

## ---- eval=FALSE, warning=FALSE, results="hide"--------------------------
#  # Get indices of rows corresponding to IgA in the field "db"
#  # These are the same indices also in the matrices in the fileds "numbOfSeqs",
#  # "binomK", "binomN", "binomP", and "pdfs"
#  # In this example, there is one row of IgA for each sample
#  dbIgMIndex <- which(grouped_2@db$ISOTYPE == "IgA")
#  
#  grouped_2 <- editBaseline(grouped_2, "db", grouped_2@db[-dbIgMIndex, ])
#  grouped_2 <- editBaseline(grouped_2, "numbOfSeqs", grouped_2@numbOfSeqs[-dbIgMIndex, ])
#  grouped_2 <- editBaseline(grouped_2, "binomK", grouped_2@binomK[-dbIgMIndex, ])
#  grouped_2 <- editBaseline(grouped_2, "binomN", grouped_2@binomN[-dbIgMIndex, ])
#  grouped_2 <- editBaseline(grouped_2, "binomP", grouped_2@binomP[-dbIgMIndex, ])
#  grouped_2 <- editBaseline(grouped_2, "pdfs",
#                            lapply(grouped_2@pdfs, function(pdfs) {pdfs[-dbIgMIndex, ]} ))
#  
#  # The indices corresponding to IgA are slightly different in the field "stats"
#  # In this example, there is one row of IgA for each sample and for each region
#  grouped_2 <- editBaseline(grouped_2, "stats",
#                            grouped_2@stats[grouped_2@stats$ISOTYPE!="IgA", ])

