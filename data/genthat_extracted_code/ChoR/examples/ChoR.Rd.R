library(ChoR)


### Name: ChoR
### Title: Getting started with the ChoR package
### Aliases: ChoR ChoR-package
### Keywords: linear-log-analysis model package

### ** Examples

# Warning: RJava requires to **copy** your data from R into a JVM.
# If you need extra memory, use this option (here, for 4Gb) **before** loading choR.
# Note: not needed in our case, kept for the example
options( java.parameters = "-Xmx4g" )
library(ChoR)

# Helper function for graph printing. Require Rgraphviz:
# source("https://bioconductor.org/biocLite.R")
# biocLite("Rgraphviz")
printGraph = function(x){
  if(requireNamespace("Rgraphviz", quietly=TRUE)){
    attrs <- list(node=list(shape="ellipse", fixedsize=FALSE, fontsize=25))
    Rgraphviz::plot(x, attrs=attrs)
  } else { stop("Rgraphviz required for graph printing.") }
}


###### MUSHROOM #####
# We are using a partial UCI mushroom data set (the example should not be too long)
MR.url = system.file("extdata", "mushrooms.csv", package = "ChoR", mustWork = TRUE)

MR.data =
  read.csv(
              MR.url,
              header            = TRUE,             # Here, we have a header
              na.strings        = c("NA","?",""),   # Configure the missing values
              stringsAsFactors  = FALSE,            # Keep strings for now
              check.names       = TRUE              # Replace some special characters
            )

# This file has a special line with types. You can check this with MR.data[1,].
# Let's remove it:
MR.data = MR.data[-1, ]

# Launch the SMT analysis, with:
# ## default pValueThreshold=0.05
# ## computation of attributes cardinality from the data
MR.res = ChoR.SMT(MR.data)

# Access the result:
# ## As a list of cliques:
NR.cl = ChoR.as.cliques(MR.res)
print(NR.cl)
# ## As a formula
NR.fo = ChoR.as.formula(MR.res)
print(NR.fo)
# ## As a graph
if(requireNamespace("graph", quietly=TRUE)){
  NR.gr = ChoR.as.graph(MR.res)
  printGraph(NR.gr)
} else {
  print("'graph' package not installed; Skipping 'as graph' example.")
}



###### Titanic #####
# We are using the titanix data set

MR.url = system.file("extdata", "titanic.dat.txt", package = "ChoR", mustWork = TRUE)

T.data =
  read.csv( MR.url,
            sep               = "",       # White spaces
            header            = FALSE,
            stringsAsFactors  = FALSE
          )

# Give meaningful names
colnames(T.data) = c(   "Class", "Age", "Sex", "Survived" )
# Chordalysis
T.res = ChoR.SMT(T.data, card = c(4, 2, 2, 2))

if(requireNamespace("graph", quietly=TRUE)){
  T.gr = ChoR.as.graph(T.res)
  printGraph(T.gr)
}



