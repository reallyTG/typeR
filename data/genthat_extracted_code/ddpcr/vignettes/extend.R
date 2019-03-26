## ----defineparent--------------------------------------------------------
parent_plate_type.fam_border <- function(plate) {
  "ddpcr_plate"
}

## ----defineparams--------------------------------------------------------
define_params.fam_border <- function(plate) {
  params <- NextMethod("define_params")
  
  new_params <- list(
    'REMOVE_FAILURES' = list(
      'TOTAL_DROPS_T' = 14000  # overwriting an existing parameter
    ),
    'GATE' = list(
      'FAM_BORDER' = 5000  # defining a new parameter
    )
  )
  params <- modifyList(params, new_params)
  
  params
}

## ----defineclusters------------------------------------------------------
define_clusters.fam_border <- function(plate) {
  clusters <- NextMethod("define_clusters")
  
  c(clusters,
    'FAM_POSITIVE',
    'FAM_NEGATIVE'
  )
}

## ----definesteps---------------------------------------------------------
define_steps.fam_border <- function(plate) {
  steps <- NextMethod("define_steps")
  
  c(steps,
    list(
      'GATE' = 'gate_droplets'
    ))
}

## ----definegatestep------------------------------------------------------
gate_droplets <- function(plate) {
  # make sure this step was not called prematurely
  current_step <- step(plate, 'GATE')
  check_step(plate, current_step)  
  
  # show an informative message to the user
  step_begin("Classifying droplets as FAM-positive or negative")
  
  data <- plate_data(plate)
  border <- params(plate, 'GATE', 'FAM_BORDER')
  
  # get a list of clusters that have not been considered yet in the analysis
  # this is useful so that we only look at droplets that have not yet been
  # assigned to a cluster
  unanalyzed_clusters <- unanalyzed_clusters(plate, 'FAM_POSITIVE')
  
  # get the indices of all droplets that are FAM-positive and negative
  unanalyzed_idx <- data$cluster %in% unanalyzed_clusters
  fam_pos <- unanalyzed_idx & data$FAM >= border
  fam_neg <- unanalyzed_idx & data$FAM < border
  
  # assign each droplet to its cluster
  data[fam_pos, 'cluster'] <- cluster(plate, 'FAM_POSITIVE')
  data[fam_neg, 'cluster'] <- cluster(plate, 'FAM_NEGATIVE')
  
  # update the data on the plate object
  plate_data(plate) <- data
  
  # record how many drops in each well are in each cluster
  # and add this info to the plate's metadata
  drops_per_cluster <- 
    plyr::ddply(data, ~ well, function(x) {
      data.frame(
        'drops_positive' = sum(x$cluster == cluster(plate, 'FAM_POSITIVE')),
        'drops_negative' = sum(x$cluster == cluster(plate, 'FAM_NEGATIVE'))
      )
    })
  plate_meta(plate) <-
    dplyr::left_join(
      plate_meta(plate),
      drops_per_cluster,
      by = "well"
    )
  
  # VERY IMPORTANT - do not forget to update the status of the plate
  status(plate) <- current_step
  step_end()
  
  plate
}

## ----defineplot----------------------------------------------------------
plot.fam_border <- function(x, ..., show_border = FALSE) {
  # Plot a regular ddpcr plate
  p <- NextMethod("plot", x)
  
  # Show the custom thresholds
  if (show_border) {
    border <- params(x, 'GATE', 'FAM_BORDER')
    p <- p +
      ggplot2::geom_hline(yintercept = border)
  }
  
  p
}

## ----defineborderparam---------------------------------------------------
`fam_border<-` <- function(plate, value) {
  params(plate, 'GATE', 'FAM_BORDER') <- value
  plate
}

## ----customanalysis, fig.show='hold', out.width='50%', fig.retina=FALSE----
library(ddpcr)
plate <- new_plate(dir = sample_data_dir(), type = "fam_border")
fam_border(plate) <- 8000
plate <- analyze(plate)
plot(plate, show_drops_empty = TRUE)
plot(plate, col_drops_fam_negative = "red",
     col_drops_fam_positive = "blue", show_border = TRUE)
plate_meta(plate, only_used = TRUE)

