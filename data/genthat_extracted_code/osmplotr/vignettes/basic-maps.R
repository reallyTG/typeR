## ---- echo = FALSE, message = FALSE--------------------------------------
#library (osmplotr)
#devtools::install_github ("ropensci/osmplotr")
devtools::load_all ("../.", export_all = FALSE)
map_dpi <- 72 # dpi res for all maps

## ---- echo = FALSE, message = FALSE--------------------------------------
dat_B <- rbind (london$dat_BR, london$dat_BNR)
dat_H <- rbind (london$dat_H, london$dat_HP)
dat_T <- london$dat_T

## ----get-bbox------------------------------------------------------------
bbox <- get_bbox (c (-0.13, 51.51, -0.11, 51.52))

## ----extract buildings, eval = FALSE-------------------------------------
#  dat_B <- extract_osm_objects (key = 'building', bbox = bbox)

## ----basemap1------------------------------------------------------------
map <- osm_basemap (bbox = bbox, bg = 'gray20')

## ----add objects1--------------------------------------------------------
map <- add_osm_objects (map, dat_B, col = 'gray40')

## ---- eval = FALSE-------------------------------------------------------
#  print_osm_map (map)

## ----map1-print, echo = FALSE--------------------------------------------
print_osm_map (map, filename = 'map_a1.png', width = 600,
               units = 'px', dpi = map_dpi)

## ----buildings-highways, eval = FALSE------------------------------------
#  bbox <- get_bbox (c(-0.13, 51.51, -0.11, 51.52))
#  dat_B <- extract_osm_objects (key = 'building', bbox = bbox)
#  dat_H <- extract_osm_objects (key = 'highway', bbox = bbox)

## ------------------------------------------------------------------------
class (dat_B); class (dat_H)
class (dat_B$geometry); class (dat_H$geometry)

## ---- eval = FALSE-------------------------------------------------------
#  dat_B <- extract_osm_objects (key = 'building', bbox = bbox, sf = FALSE)

## ------------------------------------------------------------------------
nrow (dat_B); nrow (dat_H)

## ----trees, eval = FALSE-------------------------------------------------
#  dat_T <- extract_osm_objects (key = 'natural', value = 'tree', bbox = bbox)

## ------------------------------------------------------------------------
class (dat_T$geometry); nrow (dat_T)

## ---- eval = FALSE-------------------------------------------------------
#  dat1 <- osmplotr::extract_osm_objects (key = 'highway', value = '!primary',
#                                         bbox = bbox)
#  dat2 <- osmdata::opq (bbox = bbox) %>%
#      add_feature (key = 'highway') %>%
#      add_feature (key = 'highway', value = '!primary') %>%
#      osmdata_sf ()
#  dat2 <- dat2$osm_lines

## ----not trees, eval = FALSE---------------------------------------------
#  dat_NT <- extract_osm_objects (bbox = bbox, key = 'natural', value = '!tree')

## ---- echo = FALSE-------------------------------------------------------
message ("Cannot determine return type; maybe specify explicitly?")

## ----not tree points, eval = FALSE---------------------------------------
#  pts_NT <- extract_osm_objects (bbox = bbox, key = 'natural', value = '!tree',
#                                 return_type = 'points')

## ----royal festival hall, eval = FALSE-----------------------------------
#  bbox <- get_bbox (c(-0.13, 51.50, -0.11, 51.52))
#  extra_pairs <- c ('name', 'Royal.Festival.Hall')
#  dat <- extract_osm_objects (key = 'building', extra_pairs = extra_pairs,
#                                         bbox = bbox)

## ----stamford st 150, eval = FALSE---------------------------------------
#  extra_pairs <- list (c ('addr:street', 'Stamford.St'),
#                       c ('addr:housenumber', '150'))
#  dat <- extract_osm_objects (key = 'building', extra_pairs = extra_pairs,
#                                        bbox = bbox)

## ------------------------------------------------------------------------
osm_structures ()

## ------------------------------------------------------------------------
osm_structures()$value [1:4]

## ---- eval = FALSE-------------------------------------------------------
#  dat <- make_osm_map (structures = osm_structures (), bbox = bbox)

## ---- echo = FALSE-------------------------------------------------------
dat1 <- list (dat_BU = NULL, dat_A = NULL, dat_W = NULL, dat_G = NULL,
              dat_N = NULL, dat_P = NULL, dat_H = NULL, dat_BO = NULL,
              dat_T = NULL)
dat <- list (osm_data = dat1, map = ggplot2::ggplot ())

## ------------------------------------------------------------------------
names (dat); sapply (dat, class); names (dat$osm_data)

## ------------------------------------------------------------------------
osm_structures (structures = c('building', 'highway'))

## ------------------------------------------------------------------------
osm_structures (structures = 'grass')

## ------------------------------------------------------------------------
structures <- c ('highway', 'highway', 'building', 'building', 'building',
                 'amenity', 'park', 'natural', 'tree')
structs <- osm_structures (structures = structures, col_scheme = 'dark')
structs$value [1] <- '!primary'
structs$value [2] <- 'primary'
structs$suffix [2] <- 'HP'
structs$value [3] <- '!residential'
structs$value [4] <- 'residential'
structs$value [5] <- 'commercial'
structs$suffix [3] <- 'BNR'
structs$suffix [4] <- 'BR'
structs$suffix [5] <- 'BC'

## ---- eval = FALSE-------------------------------------------------------
#  london <- make_osm_map (structures = structs, bbox = bbox)$osm_data

## ---- echo = FALSE-------------------------------------------------------
load (system.file ('extdata', 'hwys.rda', package = 'osmplotr'))
highways1 <- hwys [[1]]
highways2 <- hwys [[2]]
highways3 <- hwys [[3]]

## ---- eval = FALSE-------------------------------------------------------
#  highways <- c ('Monmouth.St', 'Short.?s.Gardens', 'Endell.St', 'Long.Acre',
#                 'Upper.Saint.Martin')
#  highways1 <- connect_highways (highways = highways, bbox = bbox)

## ------------------------------------------------------------------------
class (highways1); length (highways1); highways1 [[1]] [[1]]

## ----connect_highways, fig.width = 4, message = FALSE, eval = FALSE------
#  bbox_big <- get_bbox (c(-0.15, 51.5, -0.10, 51.52))
#  highways <- c ('Kingsway', 'Holborn', 'Farringdon.St', 'Strand',
#                 'Fleet.St', 'Aldwych')
#  highway_list <- connect_highways (highways = highways, bbox = bbox_big,
#                                    plot = TRUE)

## ----connect-highways-manual-plot, fig.width = 4, echo = FALSE-----------
load (system.file ("extdata", "hwys.rda", package = "osmplotr"))
ways <- hwys$highways4
osmplotr:::plot_highways (ways)
ways <- osmplotr:::connect_single_ways (ways)
ways <- osmplotr:::get_highway_cycle (ways)

conmat <- osmplotr:::get_conmat (ways)
cycles <- try (ggm::fundCycles (conmat), TRUE)
cyc <- cycles [[which.max (sapply (cycles, nrow))]]

path <- osmplotr:::sps_through_cycle (ways, cyc)
lines (path [, 1], path [, 2], lwd = 2, lty = 2)

## ---- eval = FALSE-------------------------------------------------------
#  dat_B <- extract_osm_objects (key = 'building', bbox = bbox)
#  dat_H <- extract_osm_objects (key = 'highway', bbox = bbox)
#  dat_T <- extract_osm_objects (key = 'natural', value = 'tree', bbox = bbox)

## ----map2----------------------------------------------------------------
bbox_small <- get_bbox (c(-0.13, 51.51, -0.11, 51.52))
map <- osm_basemap (bbox = bbox_small, bg = 'gray20')
map <- add_osm_objects (map, dat_H, col = 'gray70')
map <- add_osm_objects (map, dat_B, col = 'gray40')

## ---- eval = FALSE-------------------------------------------------------
#  print_osm_map (map)

## ----map2-print, echo = FALSE--------------------------------------------
print_osm_map (map, filename = 'map_a2.png', width = 600,
               units = 'px', dpi = map_dpi)

## ----map3, eval = FALSE--------------------------------------------------
#  map <- osm_basemap (bbox = bbox_small, bg = 'gray20')
#  map <- add_osm_objects (map, dat_B, col = 'gray40', border = 'orange',
#                          size = 0.2)
#  print_osm_map (map)

## ----map3-print, echo = FALSE--------------------------------------------
map <- osm_basemap (bbox = bbox_small, bg = 'gray20')
map <- add_osm_objects (map, dat_B, col = 'gray40', border = 'orange',
                        size = 0.2)
print_osm_map (map, filename = 'map_a3.png', width = 600,
               units = 'px', dpi = map_dpi)

## ----map4, eval = FALSE--------------------------------------------------
#  map <- add_osm_objects (map, dat_H, col = 'gray70', size = 0.7)
#  map <- add_osm_objects (map, dat_T, col = 'green', size = 2, shape = 1)
#  print_osm_map (map)

## ----map4-print, echo = FALSE--------------------------------------------
map <- add_osm_objects (map, dat_H, col = 'gray70', size = 0.7)
map <- add_osm_objects (map, dat_T, col = 'green', size = 2, shape = 1)
print_osm_map (map, filename = 'map_a4.png', width = 600,
               units = 'px', dpi = map_dpi)

## ---- eval = FALSE-------------------------------------------------------
#  print_osm_map (map)

## ---- eval = FALSE-------------------------------------------------------
#  print_osm_map (map, filename = "map.png", width = 10,
#                 units = "in", dpi = map_dpi)
#  print_osm_map (map, filename = "map.eps", width = 1000,
#                 units = "px", dpi = map_dpi)
#  print_osm_map (map, filename = "map", device = "jpeg", width = 10, units = "cm")

## ---- eval = FALSE-------------------------------------------------------
#  dat_HP <- extract_osm_objects (key = 'highway', value = 'primary', bbox = bbox)
#  dat_H <- extract_osm_objects (key = 'highway', value = '!primary', bbox = bbox)

## ---- echo = FALSE-------------------------------------------------------
dat_HP <- london$dat_HP
dat_H <- london$dat_H

## ----map5, eval = FALSE--------------------------------------------------
#  map <- osm_basemap (bbox = bbox_small, bg = 'gray20')
#  map <- add_osm_objects (map, dat_H, col = 'gray50')
#  map <- add_osm_objects (map, dat_HP, col = 'gray80', size = 2)
#  print_osm_map (map)

## ----map5-print, echo = FALSE--------------------------------------------
map <- osm_basemap (bbox = bbox_small, bg = 'gray20')
map <- add_osm_objects (map, dat_H, col = 'gray50')
map <- add_osm_objects (map, dat_HP, col = 'gray80', size = 2)
print_osm_map (map, filename = 'map_a5.png', width = 600,
               units = 'px', dpi = map_dpi)

## ---- echo = FALSE-------------------------------------------------------
dat_RFH <- london$dat_RFH
dat_ST <- london$dat_ST

## ----map7, eval = FALSE--------------------------------------------------
#  bbox_small2 <- get_bbox (c (-0.118, 51.504, -0.110, 51.507))
#  map <- osm_basemap (bbox = bbox_small2, bg = 'gray95')
#  map <- add_osm_objects (map, dat_H, col = 'gray80')
#  map <- add_osm_objects (map, dat_HP, col = 'gray20', size = 2)
#  map <- add_osm_objects (map, dat_RFH, col = 'orange', border = 'red', size = 2)
#  map <- add_osm_objects (map, dat_ST, col = 'skyblue', border = 'blue', size = 2)
#  print_osm_map (map)

## ----map7-print, echo = FALSE--------------------------------------------
bbox_small2 <- get_bbox (c (-0.118, 51.504, -0.110, 51.507))
map <- osm_basemap (bbox = bbox_small2, bg = 'gray95')
map <- add_osm_objects (map, dat_H, col = 'gray80')
map <- add_osm_objects (map, dat_HP, col = 'gray60', size = 2)
map <- add_osm_objects (map, dat_RFH, col = 'orange', border = 'red', size = 2)
map <- add_osm_objects (map, dat_ST, col = 'skyblue', border = 'blue', size = 2)
print_osm_map (map, filename = 'map_a7.png', width = 600,
               units = 'px', dpi = map_dpi)

## ---- eval = FALSE-------------------------------------------------------
#  library (osmdata)
#  bb <- osmdata::getbb ("melbourne, australia")
#  coast <- extract_osm_objects (bbox = bb, key = "natural", value = "coastline",
#                                return_type = "line")
#  coast <- osm_line2poly (coast, bbox = bb)
#  map <- osm_basemap (bbox = bb) %>%
#          add_osm_objects (coast [[1]], col = "lightsteelblue") %>%
#          print_osm_map ()

## ----map8, eval = FALSE--------------------------------------------------
#  structs <- c ('highway', 'building', 'park', 'tree')
#  structures <- osm_structures (structures = structs, col_scheme = 'light')
#  dat <- make_osm_map (structures = structures, bbox = bbox_small)
#  print_osm_map (dat$map)

## ---- echo = FALSE-------------------------------------------------------
structs <- c ('highway', 'building', 'park', 'tree')
structures <- osm_structures (structures = structs, col_scheme = 'light')
osm_dat <- list (dat_B = dat_B, dat_H = dat_H, dat_P = london$dat_P,
                 dat_A = london$dat_A, dat_P = london$dat_P,
                 dat_T = london$dat_T)
dat <- make_osm_map (structures = structures, osm_data = osm_dat,
                     bbox = bbox)
print_osm_map (dat$map, filename = 'map_a8.png', width = 600,
               units = 'px', dpi = map_dpi)

## ------------------------------------------------------------------------
names (dat); names (dat$osm_data)

## ----map9, eval = FALSE--------------------------------------------------
#  dat <- make_osm_map (structures = structures, osm_data = dat$osm_data,
#                       bbox = bbox)
#  print_osm_map (dat$map)

## ----map9-print, echo = FALSE--------------------------------------------
dat <- make_osm_map (structures = structures, osm_data = osm_dat, bbox = bbox)
print_osm_map (dat$map, filename = 'map_a9.png', width = 600,
               units = 'px', dpi = map_dpi)

## ------------------------------------------------------------------------
structs <- c ('amenity', 'building', 'highway', 'park')
osm_structures (structs, col_scheme = 'light')

## ----map10---------------------------------------------------------------
structures <- osm_structures (structures = structs, col_scheme = 'dark')
dat <- make_osm_map (structures = structures, osm_data = dat$osm_dat,
                     bbox = bbox_small)
map <- add_axes (dat$map, colour = 'black')

## ---- eval = FALSE-------------------------------------------------------
#  print_osm_map (map)

## ----map10-print, echo = FALSE-------------------------------------------
print_osm_map (map, filename = 'map_a10.png', width = 600,
               units = 'px', dpi = map_dpi)

## ----map11, eval = FALSE-------------------------------------------------
#  map <- add_axes (map, colour = 'blue', pos = c(0.1, 0.2),
#                        fontsize = 5, fontface = 3, fontfamily = "Times")
#  print_osm_map (map)

## ----map11-print, echo = FALSE-------------------------------------------
map <- add_axes (map, colour = 'blue', pos = c(0.1, 0.2),
                      fontsize = 5, fontface = 3, fontfamily = "Times")
print_osm_map (map, filename = 'map_a11.png', width = 600,
               units = 'px', dpi = map_dpi)

