## ---- echo=FALSE, cache=FALSE---------------------------------------------------------------------
options(width = 100)

## -------------------------------------------------------------------------------------------------
library("NetRep")
data("NetRep")

## -------------------------------------------------------------------------------------------------
# Read in the data:
data("NetRep")

# Set up the input data structures for NetRep. We will call these datasets 
# "cohort1" and "cohort2" to avoid confusion with the "discovery" and "test"
# arguments in NetRep's functions:
data_list <- list(cohort1=discovery_data, cohort2=test_data)
correlation_list <- list(cohort1=discovery_correlation, cohort2=test_correlation)
network_list <- list(cohort1=discovery_network, cohort2=test_network)

# We do not need to set up a list for the 'moduleAssignments', 'modules', or 
# 'test' arguments because there is only one "discovery" dataset.

## -------------------------------------------------------------------------------------------------
# Assess the preservation of modules in the test dataset.
preservation <- modulePreservation(
 network=network_list, data=data_list, correlation=correlation_list, 
 moduleAssignments=module_labels, discovery="cohort1", test="cohort2", 
 nPerm=10000, nThreads=2
)

## -------------------------------------------------------------------------------------------------
preservation$observed
preservation$p.value

## -------------------------------------------------------------------------------------------------
# Get the maximum permutation test p-value
max_pval <- apply(preservation$p.value, 1, max)
max_pval

## ---- eval=FALSE----------------------------------------------------------------------------------
#  # Handling NA entries in the 'cor.degree' null distribution for sparse networks
#  
#  # Get the entries in the null distribution where there were no edges in the
#  # permuted module
#  na.entries <- which(is.na(preservation$nulls[,'cor.degree',]))
#  no.edges <- which(preservation$nulls[,'avg.weight',][na.entries] == 0)
#  
#  # Set those entries to 0
#  preservation$nulls[,'cor.degree',][no.edges] <- 0
#  
#  # Recalculate the permutation test p-values
#  preservation$p.values <- permutationTest(
#    preservation$nulls, preservation$observed, preservation$nVarsPresent,
#    preservation$totalSize, preservation$alternative
#  )

## ---- eval=FALSE----------------------------------------------------------------------------------
#  not.present <- which(discovery_data == 0)
#  nSamples <- nrow(discovery_data)
#  discovery_data[not.present] <- runif(length(not.present), min=0, max=1/nSamples)

## ----modules_in_discovery, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
plotModule(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=c(1,2,3,4),
  discovery="cohort1", test="cohort1"
)

## ----modules_in_test, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
plotModule(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=c(1,2,3,4),
  discovery="cohort1", test="cohort2"
)

## ----mean_degree, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
plotModule(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=c(1,4), # only the preserved modules
  discovery="cohort1", test="cohort2",
  orderNodesBy=c("cohort1", "cohort2") # this can be any number of datasets
)

## ----dry_run, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
plotModule(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=c(1,4),
  discovery="cohort1", test="cohort2",
  orderNodesBy=c("cohort1", "cohort2"),
  dryRun=TRUE
)

## ----dry_run_customised, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
# Change the margins so the plot is more compressed. Alternatively we could 
# change the device window.
par(mar=c(3,10,3,10)) # bottom, left, top, right margin sizes
plotModule(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=c(1,4),
  discovery="cohort1", test="cohort2",
  orderNodesBy=c("cohort1", "cohort2"),
  dryRun=TRUE, 
  # Title of the plot
  main = "Preserved modules", 
  # Use the maximum edge weight as the highest value instead of 1 in the
  # network heatmap
  netRange=NA,
  # Turn off the node and sample labels:
  plotNodeNames=FALSE, plotSampleNames=FALSE,
  # The distance from the bottom axis should the module labels be drawn:
  maxt.line=0,
  # The distance from the legend the legend titles should be drawn:
  legend.main.line=2
)

## ----mean_degree_customised, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
par(mar=c(3,10,3,10)) 
plotModule(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=c(1,4),
  discovery="cohort1", test="cohort2",
  orderNodesBy=c("cohort1", "cohort2"), main = "Preserved modules", 
  netRange=NA, plotNodeNames=FALSE, plotSampleNames=FALSE,
  maxt.line=0, legend.main.line=2
)

## ----correlation_heatmap, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
par(mar=c(5,5,4,4)) 
plotCorrelation(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=0:4, discovery="cohort1",
  test="cohort1", symmetric=TRUE, orderModules=FALSE
)

## -------------------------------------------------------------------------------------------------
properties <- networkProperties(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, 
  # Only calculate for the reproducible modules
  modules=c(1,4),
  # what dataset were the modules identified in?
  discovery="cohort1", 
  # which datasets do we want to calculate their properties in?
  test=c("cohort1", "cohort2")
)

# The summary profile of module 1 in the discovery dataset:
properties[["cohort1"]][["1"]][["summary"]]
# Along with the proportion of variance in the module data explained by the 
# summary profile:
properties[["cohort1"]][["1"]][["coherence"]]

# The same information in the test dataset:
properties[["cohort2"]][["1"]][["summary"]]
properties[["cohort2"]][["1"]][["coherence"]]

## ---- echo=FALSE, message=FALSE, results="hide"---------------------------------------------------
# This is the code necessary for the later part of this section to run.
# The vignette doesnt actually save the data.
discovery_data <- as.disk.matrix(discovery_data, tempfile())
discovery_correlation <- as.disk.matrix(discovery_correlation, tempfile())
discovery_network <- as.disk.matrix(discovery_network, tempfile())
test_data <- as.disk.matrix(test_data, tempfile())
test_correlation <- as.disk.matrix(test_correlation, tempfile())
test_network <- as.disk.matrix(test_network, tempfile())

## ---- eval=FALSE----------------------------------------------------------------------------------
#  # serialize=TRUE will save the data using 'saveRDS'.
#  # serialize=FALSE will save the data as a tab-separated file ('sep="\t"').
#  discovery_data <- as.disk.matrix(
#    x=discovery_data,
#    file="discovery_data.rds",
#    serialize=TRUE)
#  discovery_correlation <- as.disk.matrix(
#    x=discovery_correlation,
#    file="discovery_correlation.rds",
#    serialize=TRUE)
#  discovery_network <- as.disk.matrix(
#    x=discovery_network,
#    file="discovery_network.rds",
#    serialize=TRUE)
#  test_data <- as.disk.matrix(
#    x=test_data,
#    file="test_data.rds",
#    serialize=TRUE)
#  test_correlation <- as.disk.matrix(
#    x=test_correlation,
#    file="test_correlation.rds",
#    serialize=TRUE)
#  test_network <- as.disk.matrix(
#    x=test_network,
#    file="test_network.rds",
#    serialize=TRUE)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  test_network

## ---- echo=FALSE----------------------------------------------------------------------------------
cat("Pointer to matrix stored at test_network.rds\n")

## -------------------------------------------------------------------------------------------------
as.matrix(test_network)[1:5, 1:5]

## ---- eval=FALSE----------------------------------------------------------------------------------
#  # If files are saved as tables, set 'serialized=FALSE' and specify arguments
#  # that would normally be provided to 'read.table'. Note: this function doesnt
#  # check whether the file can actually be read in as a matrix!
#  discovery_data <- attach.disk.matrix("discovery_data.rds")
#  discovery_correlation <- attach.disk.matrix("discovery_correlation.rds")
#  discovery_network <- attach.disk.matrix("discovery_network.rds")
#  test_data <- attach.disk.matrix("test_data.rds")
#  test_correlation <- attach.disk.matrix("test_correlation.rds")
#  test_network <- attach.disk.matrix("test_network.rds")

## -------------------------------------------------------------------------------------------------
data_list <- list(cohort1=discovery_data, cohort2=test_data)
correlation_list <- list(cohort1=discovery_correlation, cohort2=test_correlation)
network_list <- list(cohort1=discovery_network, cohort2=test_network)

## -------------------------------------------------------------------------------------------------
# Assess the preservation of modules in the test dataset.
preservation <- modulePreservation(
 network=network_list, data=data_list, correlation=correlation_list, 
 moduleAssignments=module_labels, discovery="cohort1", test="cohort2", 
 nPerm=10000, nThreads=2
)

## -------------------------------------------------------------------------------------------------
# Determine the nodes and samples on a plot in advance:
nodesToPlot <- nodeOrder(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=c(1,4), discovery="cohort1", 
  test=c("cohort1", "cohort2"), mean=TRUE
)
# We need to know which module will appear left-most on the plot:
firstModule <- module_labels[nodesToPlot[1]]

samplesToPlot <- sampleOrder(
  data=data_list, correlation=correlation_list, network=network_list, 
  moduleAssignments=module_labels, modules=firstModule, discovery="cohort1",
  test="cohort2"
)

# Load in the dataset we are plotting:
test_data <- as.matrix(test_data)
test_correlation <- as.matrix(test_correlation)
test_network <- as.matrix(test_network)

## ----disk_matrix_dry_run, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
# Now we can use 'dryRun=TRUE' quickly:
plotModule(
  data=test_data[samplesToPlot, nodesToPlot], 
  correlation=test_correlation[nodesToPlot, nodesToPlot], 
  network=test_network[nodesToPlot, nodesToPlot],
  moduleAssignments=module_labels[nodesToPlot],
  orderNodesBy=NA, orderSamplesBy=NA, dryRun=TRUE
)

## ----disk_matrix_plot, dev="jpeg", dev.args=list(quality=50),  dpi=72, fig.height=7, fig.width=7, fig.align="center", results="hold", fig.keep="last", fig.show="hold"----
# And draw the final plot once we determine the plot parameters 
par(mar=c(3,10,3,10)) 
plotModule(
  data=test_data[samplesToPlot, nodesToPlot], 
  correlation=test_correlation[nodesToPlot, nodesToPlot], 
  network=test_network[nodesToPlot, nodesToPlot],
  moduleAssignments=module_labels[nodesToPlot],
  orderNodesBy=NA, orderSamplesBy=NA
)

## ---- echo=FALSE, hold=TRUE-----------------------------------------------------------------------
cat(
"[2016-06-14 17:25:16 AEST] Validating user input...\n",
"[2016-06-14 17:25:16 AEST]   Loading matrices of dataset \"liver\" into RAM...\n",
"[2016-06-14 17:26:29 AEST]   Checking matrices for problems...\n",
"[2016-06-14 17:26:31 AEST]   Unloading dataset from RAM...\n",
"[2016-06-14 17:26:31 AEST]   Loading matrices of dataset \"brain\" into RAM...\n",
"[2016-06-14 17:27:45 AEST]   Checking matrices for problems...\n",
"[2016-06-14 17:27:47 AEST] Input ok!\n",
"[2016-06-14 17:27:47 AEST] Calculating preservation of network subsets from\n",
"                           dataset \"brain\" in dataset \"liver\".\n",
"[2016-06-14 17:27:47 AEST]   Pre-computing intermediate properties in dataset\n",
"                             \"brain\"...\n",
"[2016-06-14 17:27:48 AEST]   Unloading dataset from RAM...\n",
"[2016-06-14 17:27:48 AEST]   Loading matrices of dataset \"liver\" into RAM...\n",
"[2016-06-14 17:29:01 AEST]   Calculating observed test statistics...\n",
"[2016-06-14 17:29:02 AEST]   Generating null distributions from 320\n",
"                             permutations using 32 threads...\n",
"\n",
"  100% completed.\n",
"\n",
"[2016-06-14 17:29:24 AEST]   Calculating P-values...\n",
"[2016-06-14 17:29:24 AEST]   Collating results...\n",
"[2016-06-14 17:29:24 AEST] Unloading dataset from RAM...\n",
"[2016-06-14 17:29:25 AEST] Done!\n", sep=""
)

