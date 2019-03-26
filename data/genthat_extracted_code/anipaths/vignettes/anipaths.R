## ---- fig.show='hold', fig.cap="test", eval = F--------------------------
#  library(anipaths)
#  vultures$POSIX <- as.POSIXct(vultures$timestamp, tz = "UTC")
#  vultures_paths <- vultures[format(vultures$POSIX, "%Y") == 2009, ] ## limit attention to 2009
#  delta.t <- "day"
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                ID.name = "individual.local.identifier")

## ----map_logical, eval = F-----------------------------------------------
#  delta.t <- "week"
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                ID.name = "individual.local.identifier",
#                background = TRUE)

## ----map_google, eval = F------------------------------------------------
#  vultures_paths <- vultures[format(vultures$POSIX, "%Y") == 2009:2010, ]
#  delta.t <- 3600*24*2 ## number of seconds in two days
#  background <- list(location = c(-90, 10),
#                     zoom = 3,
#                     maptype = "satellite")
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                ID.name = "individual.local.identifier",
#                background = background)

## ----map_simple, eval = F------------------------------------------------
#  delta.t <- "week"
#  background <- rworldmap::getMap(resolution = "coarse")
#  sp::proj4string(background) ## matches default projection in animate_paths()
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                ID.name = "individual.local.identifier",
#                background = background)

## ----make_covariates, eval = F-------------------------------------------
#  behaviors <- c("exploratory", "directed", "stationary")
#  set.seed(1)
#  vultures_paths$behavior <-
#    unlist(sapply(unique(vultures_paths$individual.local.identifier), function(id){
#      v_id <- vultures_paths[vultures_paths$individual.local.identifier == id, ]
#      switches <- c(0, sort(sample(1:nrow(v_id), 2)), nrow(v_id))
#      rep(behaviors[sample(1:3, 3)], diff(switches))
#    }))

## ----plot_covariates, eval = F-------------------------------------------
#  delta.t <- "day"
#  background <- rworldmap::getMap(resolution = "coarse")
#  sp::proj4string(background)
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                covariate = "behavior", covariate.colors = viridis::viridis(3),
#                ID.name = "individual.local.identifier",
#                background = background, max.knots = 80)

## ----generate_synchronous, eval = F--------------------------------------
#  delta.t <- 3600*24*3 ## 3 days between synchronized observations
#  background <- rworldmap::getMap(resolution = "coarse")
#  sp::proj4string(background)
#  behaviors <- c("exploratory", "directed", "stationary")
#  set.seed(1)
#  vultures_paths$behavior <-
#    unlist(sapply(unique(vultures_paths$individual.local.identifier), function(id){
#      v_id <- vultures_paths[vultures_paths$individual.local.identifier == id, ]
#      switches <- c(0, sort(sample(1:nrow(v_id), 2)), nrow(v_id))
#      rep(behaviors[sample(1:3, 3)], diff(switches))
#    }))
#  synchro_paths <- animate_paths(paths = vultures_paths, max.knots = 70,
#                                 delta.t = delta.t, covariate = "behavior",
#                                 coord = c("location.long", "location.lat"), res = 2,
#                                 Time.name = "POSIX", ID.name = "individual.local.identifier",
#                                 return.paths = T)

## ----animate_sync_covariates, eval = F-----------------------------------
#  names(synchro_paths$covariate.interp) <- "behavior"
#  animate_paths(paths = synchro_paths$paths.interp, times = synchro_paths$times,
#                covariate = synchro_paths$covariate.interp,
#                covariate.colors = 1:3, background = background)

## ----uncertainty_anim, eval=F--------------------------------------------
#  vultures_paths <- vultures[format(vultures$POSIX, "%Y") == 2009 &
#                               vultures$location.lat > 32 &
#                               vultures$individual.local.identifier != "Mark", ]
#  delta.t <- "day"
#  background <- rworldmap::getMap(resolution = "coarse")
#  sp::proj4string(background)
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                ID.name = "individual.local.identifier",
#                background = background, uncertainty.level = 0.99)

## ----whole_path_anim, eval=F---------------------------------------------
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                ID.name = "individual.local.identifier",
#                background = background,
#                whole.path = TRUE, tail.length = 0)

## ----dim_anim, eval=F----------------------------------------------------
#  vultures_paths <- vultures[format(vultures$POSIX, "%Y") == 2009 &
#                               vultures$location.lat > 32, ]
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                ID.name = "individual.local.identifier",
#                background = background, dimmed = c(1, 3, 5))

## ----make_network, eval=F------------------------------------------------
#  vultures_paths <- vultures[format(vultures$POSIX, "%Y") == 2009, ]
#  set.seed(1)
#  n_indiv <- length(unique(vultures_paths$individual.local.identifier))
#  change_pts <- 5
#  network_times <- seq(min(vultures_paths$POSIX), max(vultures_paths$POSIX), l = change_pts + 2)
#  network <- array(NA, dim = c(n_indiv, n_indiv, length(network_times)))
#  for(time_i in 2:length(network_times)){
#    network_mat <- matrix(sample(1:0, n_indiv^2, prob = c(0.1, 0.9), replace = T),
#                          n_indiv, n_indiv)
#    network_mat[lower.tri(network_mat)] <- t(network_mat)[lower.tri(network_mat)]
#    diag(network_mat) <- 1
#    network[, , (time_i - 1):time_i] <- network_mat
#  }

## ----network_anim, eval=F------------------------------------------------
#  delta.t <- 3600*24*2
#  animate_paths(paths = vultures_paths,
#                delta.t = delta.t,
#                coord = c("location.long", "location.lat"),
#                Time.name = "POSIX",
#                ID.name = "individual.local.identifier", max.knots = 50,
#                background = background, network = network, network.times = network_times)

