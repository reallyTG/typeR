## ---- echo = FALSE-------------------------------------------------------
map_dpi <- 72 # dpi res for all maps
fetch_osm <- FALSE

## ----GMFuncs, message=FALSE, eval = fetch_osm----------------------------
#  library (osmplotr)
#  library (osmdata)
#  library (magrittr)
#  
#  bbox <- osmdata::getbb ("greater melbourne, australia")
#  coast <- opq (bbox = bbox) %>%
#      add_osm_feature (key = "natural", value = "coastline") %>%
#      osmdata_sf (quiet = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  coast

## ---- echo = FALSE-------------------------------------------------------
message (paste0 ("Object of class 'osmdata' with:\n",
"                 $bbox : -38.49937,144.44405,-37.40175,146.1925\n",
"        $overpass_call : The call submitted to the overpass API\n",
"            $timestamp : [ Thurs 5 Oct 2017 10:23:18 ]\n",
"           $osm_points : 'sf' Simple Features Collection with 13635 points\n",
"            $osm_lines : 'sf' Simple Features Collection with 73 linestrings\n",
"         $osm_polygons : 'sf' Simple Features Collection with 12 polygons\n",
"       $osm_multilines : 'sf' Simple Features Collection with 0 multilinestrings\n",
"    $osm_multipolygons : 'sf' Simple Features Collection with 0 multipolygons"))

## ---- eval = fetch_osm---------------------------------------------------
#  coast_poly <- osm_line2poly (coast$osm_lines, bbox)
#  names(coast_poly)

## ---- echo = FALSE-------------------------------------------------------
c ("sea", "land", "islands")

## ---- eval = FALSE-------------------------------------------------------
#  class (coast_poly$sea)

## ---- echo = FALSE-------------------------------------------------------
c ("sf", "data.frame")

## ---- eval = fetch_osm---------------------------------------------------
#  map <- osm_basemap (bbox = bbox, bg = "cadetblue2") %>%
#    add_osm_objects (coast_poly$land, col = "lightyellow1") %>%
#    add_osm_objects (coast_poly$islands, col="orange") %>%
#    add_osm_objects (coast$osm_polygons, col="purple", border = "black") %>%
#    add_osm_objects (coast$osm_lines, col="black") %>%
#    print_osm_map ()

## ---- echo=FALSE, eval = fetch_osm---------------------------------------
#  print_osm_map (map, filename = 'melb_a1.png', width = 600,
#                 units = 'px', dpi = map_dpi)

## ---- echo=FALSE---------------------------------------------------------
  getCoast <- function(bbox)
  {
    qry <- opq(bbox)
    qry <- add_osm_feature(qry, key = "natural", value = "coastline")
    return(osmdata_sf(qry))
  }
  testPlot <- function(coast, bbox)
  {
    if (!dev.cur()) dev.off()
    map <- osm_basemap(bbox=bbox)
    map <- add_osm_objects(map, coast$osm_lines)
    print_osm_map(map)
  }
  testPlotPoly <- function(coast, bbox, fname)
  {
    ## trouble doing this check properly on Travis
    if (nrow(coast$osm_lines) > 0) {
      coastp <- osm_line2poly(coast$osm_lines, bbox=bbox)
      map <- osm_basemap(bbox=bbox)
      map <- add_osm_objects(map, coastp$sea, col='cadetblue2')
      map <- add_osm_objects(map, coastp$land, col='sienna2')
      print_osm_map(map,filename = fname, width = 200,
                    units = 'px', dpi = map_dpi)
    } else {
      warning("osm query probably failed - not plotting")
      invisible(NULL)
    }
    
  }
  

## ---- eval = fetch_osm---------------------------------------------------
#  test_plot <- function (bbox)
#  {
#      dat <- opq (bbox) %>%
#          add_osm_feature (key = "natural", value = "coastline") %>%
#          osmdata_sf (quiet = FALSE)
#      coast <- osm_line2poly (dat$osm_lines, bbox)
#      osm_basemap (bbox = bbox) %>%
#          add_osm_objects(coast$sea, col = 'cadetblue2') %>%
#          add_osm_objects(coast$land, col = 'sienna2')
#  }

## ---- eval = fetch_osm, echo = FALSE-------------------------------------
#  test_plot <- function (bbox, filename, map_dpi)
#  {
#      dat <- opq (bbox) %>%
#          add_osm_feature (key = "natural", value = "coastline") %>%
#          osmdata_sf (quiet = FALSE)
#      coast <- osm_line2poly (dat$osm_lines, bbox)
#      osm_basemap (bbox = bbox) %>%
#          add_osm_objects(coast$sea, col = 'cadetblue2') %>%
#          add_osm_objects(coast$land, col = 'sienna2') %>%
#          print_osm_map (file = filename, width = 200,
#                         units = "px", dpi = map_dpi)
#  }

## ---- eval = fetch_osm---------------------------------------------------
#      bbWE <- get_bbox (c(142.116906, -38.352713, 142.205162, -38.409661))
#      coastWE <- getCoast(bbWE)
#  
#      bbEW <- get_bbox(c(144.603127, -38.104003, 144.685557, -38.135596))
#      coastEW <- getCoast(bbEW)
#  
#      bbNS <- get_bbox(c(143.807998, -39.770986, 143.906494, -39.918643))
#      coastNS <- getCoast(bbNS)
#  
#      bbSN <- get_bbox(c(144.073544, -39.854586, 144.149318, -39.960047))
#      coastSN <- getCoast(bbSN)
#  
#      bbWW <- get_bbox(c(144.904865, -37.858295, 144.923679, -37.874367))
#      coastWW <- getCoast(bbWW)
#  
#      bbEE <- get_bbox(c(144.643383, -38.294671, 144.692197, -38.336022))
#      coastEE <- getCoast(bbEE)
#  
#      bbNN <- get_bbox(c(145.856321, -38.831642, 146.050920, -38.914031))
#      coastNN <- getCoast(bbNN)
#  
#      bbSS <- get_bbox(c(146.363768, -38.770345, 146.486389, -38.837287))
#      coastSS <- getCoast(bbSS)
#  
#      bbEN <- get_bbox(c(144.738212, -38.337690, 144.758053, -38.346966))
#      coastEN <- getCoast(bbEN)
#  
#      bbEWWS <- get_bbox(c(144.693077, -38.307526, 144.729113, -38.343997 ))
#      coastEWWS <- getCoast(bbEWWS)
#  
#      bbWS <- get_bbox(c(143.164906 ,-38.704885, 143.2075563, -38.7462058 ))
#      coastWS <- getCoast(bbWS)
#  

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastWE, bbWE, "testWE.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastEW, bbEW, "testEW.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastNS, bbNS, "testNS.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastSN, bbSN, "testSN.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastWW, bbWW, "testWW.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastEE, bbEE, "testEE.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastNN, bbNN, "testNN.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastSS, bbSS, "testSS.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastEN, bbEN, "testEN.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastEWWS, bbEWWS, "testEWWS.png")

## ---- eval = fetch_osm---------------------------------------------------
#  testPlotPoly(coastWS, bbWS, "testWS.png")

