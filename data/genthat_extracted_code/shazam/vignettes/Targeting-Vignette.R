## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Load example data
library(shazam)
data(ExampleDb, package="alakazam")

## ---- eval=FALSE---------------------------------------------------------
#  # Create substitution model using silent mutations
#  sub_matrix <- createSubstitutionMatrix(ExampleDb, model="S")
#  # Create mutability model using silent mutations
#  mut_matrix <- createMutabilityMatrix(ExampleDb, sub_matrix, model="S")
#  
#  # Extend models to include ambiguous 5-mers
#  sub_matrix <- extendSubstitutionMatrix(sub_matrix)
#  mut_matrix <- extendMutabilityMatrix(mut_matrix)
#  
#  # Create targeting model matrix from substitution and mutability matrices
#  tar_matrix <- createTargetingMatrix(sub_matrix, mut_matrix)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Collapse sequences into clonal consensus
clone_db <- collapseClones(ExampleDb, nproc=1)
# Create targeting model in one step using only silent mutations
# Use consensus sequence input and germline columns
model <- createTargetingModel(clone_db, model="S", sequenceColumn="CLONAL_SEQUENCE", 
                              germlineColumn="CLONAL_GERMLINE")

## ---- eval=TRUE, warning=FALSE, fig.width=7, fig.height=7.5--------------
# Generate hedgehog plot of mutability model
plotMutability(model, nucleotides="A", style="hedgehog")
plotMutability(model, nucleotides="C", style="hedgehog")

## ---- eval=TRUE, warning=FALSE, fig.width=7, fig.height=4.5--------------
# Generate bar plot of mutability model
plotMutability(model, nucleotides="G", style="bar")
plotMutability(model, nucleotides="T", style="bar")

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Calculate distance matrix
dist <- calcTargetingDistance(model)

