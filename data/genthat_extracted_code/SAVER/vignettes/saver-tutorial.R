## ----eval_saver, include = FALSE-----------------------------------------
# Whether or not to evaluate saver. The generated vignette was run setting it
# to be TRUE but since running requires multiple cores, this was set to be 
# FALSE for purposes of submission to CRAN.
eval.saver <- FALSE

## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = eval.saver
)

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("mohuangx/SAVER")

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("mohuangx/SAVER@*release")

## ---- eval = TRUE--------------------------------------------------------
library(SAVER)
packageVersion("SAVER")

## ------------------------------------------------------------------------
#  data.path <- "../data/expression_mRNA_17-Aug-2014.txt"
#  
#  # Need to remove first 10 rows of metadata
#  raw.data <- read.table(data.path, header = FALSE, skip = 11, row.names = 1,
#                  check.names = FALSE)
#  cortex <- as.matrix(raw.data[, -1])
#  
#  cellnames <- read.table(data.path, skip = 7, nrows = 1, row.names = 1,
#                          stringsAsFactors = FALSE)
#  colnames(cortex) <- cellnames[-1]
#  
#  dim(cortex)

## ------------------------------------------------------------------------
#  cortex.saver <- saver(cortex, ncores = 12)
#  str(cortex.saver)

## ---- eval=FALSE---------------------------------------------------------
#  cortex.saver <- saver(cortex, ncores = 12, estimates.only = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  # Identify the indices of the genes of interest
#  genes <- c("Thy1", "Mbp", "Stim2", "Psmc6", "Rps19")
#  genes.ind <- which(rownames(cortex) %in% genes)
#  
#  # Generate predictions for those genes and return entire dataset
#  cortex.saver.genes <- saver(cortex, pred.genes = genes.ind,
#                              estimates.only = TRUE)
#  
#  # Generate predictions for those genes and return only those genes
#  cortex.saver.genes.only <- saver(cortex, pred.genes = genes.ind,
#                                   pred.genes.only = TRUE, estimates.only = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  saver1 <- saver(x, pred.genes = 1:2500, pred.genes.only = TRUE,
#                  do.fast = FALSE)
#  saver2 <- saver(x, pred.genes = 2501:5000, pred.genes.only = TRUE,
#                  do.fast = FALSE)
#  saver3 <- saver(x, pred.genes = 5001:7500, pred.genes.only = TRUE,
#                  do.fast = FALSE)
#  saver4 <- saver(x, pred.genes = 7501:10000, pred.genes.only = TRUE,
#                  do.fast = FALSE)
#  
#  saver.all <- combine.saver(list(saver1, saver2, saver3, saver4))

## ---- eval=FALSE---------------------------------------------------------
#  samp1 <- sample.saver(saver1, rep = 1, seed = 50)
#  samp5 <- sample.saver(saver1, rep = 5, seed = 50)

## ---- eval=FALSE---------------------------------------------------------
#  saver1.cor.gene <- cor.genes(saver1)
#  saver1.cor.cell <- cor.cells(saver1)

