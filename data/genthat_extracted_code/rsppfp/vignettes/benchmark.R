## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(rsppfp)
library(igraph)
library(ggplot2)
library(tidyr)
library(dplyr)

## ------------------------------------------------------------------------
# Checks if the path is part of any row of the forbidden subpaths.
# Returns the logical comparison of the evaluation.
already_exists <- function(fp, path) {
  return( any( 
    apply(fp, 1, function(x) str_detect(paste(x, collapse=","), paste(path, collapse=","))) 
  ))
}


# Checks if a forbidden paths contains a subpath of another forbidden path.
# Returns the logical result of the comparison.
has_subpath <- function(fp, path) {
  # If the length if 3, evaluate as-is
  if(length(path) == 3) {
    return(already_exists(fp, path))
  }
  # Otherwise
  else {
    # We need to generate subpaths of length three
    for(i in 1:(length(path) - 2)) {
      # Check if the value is a subpath. If it is, return immediately
      if( already_exists(fp, path[i:(i+2)]) ) return(TRUE)
    }
    
    # If we got here, return false
    return(FALSE)
  }
}


# Creates random graphs using a specific seed.
# seed <- 1111
get_random_graphs <- function(seed, directory) {
  # Set a random seed
  set.seed(seed)
  
  # Prepare values
  nodesNumbers <- c(100, 300, 500)
  densities <- c(0.1, 0.5, 0.9)
  fpathsNumber <- c(50, 250, 500)
  
  
  # Create the dataframe
  graphsInfo <- data.frame(
    nCount = numeric(),
    nCountReal = numeric(),
    aCount = numeric(),
    density = numeric(),
    fCountTheoric = numeric(),
    fCountReal = numeric(), 
    gfile = character(),
    fFile = character(),
    stringsAsFactors = FALSE
  )
  
  
  # Loop through the node count
  for(nodeCount in nodesNumbers) {
    
    # Loop through the density
    for(d in densities) {
      # Get the arc count
      arcsNumber <- (nodeCount ^ 2) * d
      
      # Create a graph
      graphI <- erdos.renyi.game(nodeCount, arcsNumber, directed = TRUE, type = "gnm")
      
      # Remove nodes without edges
      graphI <- delete_vertices(graphI, V(graphI)[ degree(graphI, v = V(graphI), mode = "total") == 0])
      giDF <- as.data.frame(get.edgelist(graphI)) %>% `colnames<-`(c("from", "to"))
      
      # Loop on the number of forbidden paths
      for(fpCount in fpathsNumber) {
        
        # Get the starting nodes for forbidden paths
        randomStartNodes <- sample(x = V(graphI), size = fpCount, replace = TRUE)
        fpDF <- data.frame(matrix(ncol = 6, nrow = 0))
        
        # For each element there
        for(rsn in randomStartNodes) {
          
          # Get a random number of steps
          rSteps <- sample(3:6,1)
          
          # Create a random walk through the graph
          rWalk <- random_walk(graph = graphI, start = rsn, steps = rSteps, 
                               mode = "out", stuck = "return") %>% as.vector()
          
          # If it is at least 3 nodes long and has no subpaths
          if(length(rWalk) >= 3 & !has_subpath(fpDF, rWalk) ) {
            # Then add it to the list
            fpDF[nrow(fpDF) + 1, ] <- structure("length<-"(rWalk, 6), class = class(rWalk)) 
          }
        }
        
        # Record the files
        gFileName <- paste0(directory, "/", nodeCount, "Graph_", (d * 100), "pDense_", fpCount, "fp_Graph.csv", 
                            collapse = "")
        fFileName <- paste0(directory, "/", nodeCount, "Graph_", (d * 100), "pDense_", fpCount, "fp_Paths.csv", 
                            collapse = "")
        write.csv(file = gFileName, x = giDF, row.names = FALSE)
        write.table(fpDF, fFileName, na = "", row.names = FALSE, col.names = FALSE, append = TRUE, sep = ",")
        
        # Append to the dataframe
        graphsInfo[nrow(graphsInfo) + 1, ] <- 
          list(nodeCount, length(V(graphI)), arcsNumber, d, fpCount, nrow(fpDF), gFileName, fFileName)
      }
    } # End densities loop
  } # End arc count loop

  
  # Return the values
  return(graphsInfo)
}

## ----include=FALSE-------------------------------------------------------
# Read the data
data <- readRDS(file = "execTime.rds")

# Convert from wide to long
data$id <- rownames(data)
data <- data %>% gather("density", "value", c("d10", "d50", "d90")) %>% dplyr::arrange(id)

# Rename the levels
data$density <- as.factor(data$density)
levels(data$density) <- c("10% Density", "50% Density", "90% Density")

## ----echo=FALSE, fig.align='center', fig.show='hold', out.width='100%'----
ggplot(data = data, aes(x = nodes, y = value, group = interaction(fpaths, algorithm))) + 
    geom_line(aes(linetype = algorithm, color = as.factor(fpaths))) + 
    scale_color_manual(values=c("#ffc857", "#db3a34", "#177e89")) + 
    scale_y_continuous(name = "Execution Time (seconds)", breaks = seq(from = 0, to = 1500, by = 200)) +
    scale_x_continuous(name = "Nodes Number", breaks = unique(data$nodes)) + 
    labs(linetype = "Algorithm", color = "F. Paths", title = "Algorithms Execution Time", 
         subtitle = "Variable forbidden paths of up to 6 nodes") +
  facet_wrap(data$density %>% as.factor(), ncol = 3) +
  theme_classic()

