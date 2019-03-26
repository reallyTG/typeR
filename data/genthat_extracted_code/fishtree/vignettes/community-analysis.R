## ----setup, echo = FALSE-------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  echo = TRUE,
  eval = NOT_CRAN,
  collapse = TRUE,
  comment = "#>"
)

## ----load-packages-------------------------------------------------------
#  library(ape)
#  library(fishtree)
#  requireNamespace("rfishbase")
#  requireNamespace("picante")
#  requireNamespace("geiger")

## ----get-data------------------------------------------------------------
#  # Get reef-associated species from the `species` table
#  reef_species <- rfishbase::species(fields = c("Species", "DemersPelag"))
#  reef_species <- reef_species[reef_species$DemersPelag == "reef-associated", ]
#  
#  # Get native and endemic species from the Atlantic, Pacific, and Indian Oceans
#  eco <- rfishbase::ecosystem(species_list = reef_species$Species)
#  valid_idx <- eco$Status %in% c("native", "endemic") & eco$EcosystemName %in% c("Atlantic Ocean", "Pacific Ocean", "Indian Ocean")
#  eco <- eco[valid_idx, c("Species", "EcosystemName")]
#  
#  # Retrieve the phylogeny of only native reef species across all three oceans.
#  phy <- fishtree_phylogeny(species = eco$Species)

## ----data-cleaning-1-----------------------------------------------------
#  sample_matrix <- unclass(table(eco))
#  dimnames(sample_matrix)$Species <- gsub(" ", "_", dimnames(sample_matrix)$Species, fixed = TRUE)

## ----data-cleaning-2-----------------------------------------------------
#  nc <- geiger::name.check(phy, sample_matrix)
#  sample_matrix <- sample_matrix[!rownames(sample_matrix) %in% nc$data_not_tree, ]

## ----data-cleaning-3-----------------------------------------------------
#  cophen <- cophenetic(phy)
#  sample_matrix <- t(sample_matrix)

## ----results-------------------------------------------------------------
#  picante::ses.mpd(sample_matrix, cophen, null.model = "taxa.labels", runs = 99)
#  picante::ses.mntd(sample_matrix, cophen, null.model = "taxa.labels", runs = 99)

## ----plot, fig.width = 7, fig.height = 15--------------------------------
#  plot(phy, show.tip.label = FALSE, no.margin = TRUE)
#  obj <- get("last_plot.phylo", .PlotPhyloEnv)
#  
#  matr <- t(sample_matrix)[phy$tip.label, ]
#  xx <- obj$xx[1:obj$Ntip]
#  yy <- obj$yy[1:obj$Ntip]
#  cols <- c("#1b9e77", "#d95f02", "#7570b3")
#  for (ii in 1:ncol(matr)) {
#    present_idx <- matr[, ii] == 1
#    points(xx[present_idx] + ii, yy[present_idx], col = cols[ii], cex = 0.1)
#  }
#  
#  

