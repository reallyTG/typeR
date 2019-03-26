## ---- eval = FALSE-------------------------------------------------------
#  install.packages("osmdata")

## ------------------------------------------------------------------------
library(osmdata)

## ----install, eval = FALSE-----------------------------------------------
#  devtools::install_github('ropensci/osmdata')

## ----opq1----------------------------------------------------------------
q <- opq(bbox = c(51.1, 0.1, 51.2, 0.2))

## ----opq3, eval = FALSE--------------------------------------------------
#  q <- opq(bbox = 'greater london uk') %>%
#      add_osm_feature(key = 'highway', value = 'motorway')

## ---- echo = FALSE-------------------------------------------------------
q <- opq (bbox = c (51.2867602, -0.510375, 51.6918741, 0.3340155)) %>%
    add_osm_feature(key = 'highway', value = 'motorway')

## ----features, eval=FALSE------------------------------------------------
#  head (available_features ())

## ---- echo=FALSE---------------------------------------------------------
c ("4wd only", "abandoned", "abutters", "access", "addr", "addr:city")

## ----workflow, eval = FALSE----------------------------------------------
#  x <- opq(bbox = 'greater london uk') %>%
#      add_osm_feature(key = 'highway', value = 'motorway') %>%
#      osmdata_sf ()

## ----opq2, eval = FALSE--------------------------------------------------
#  bb = getbb('Greater London, U.K.')
#  q <- opq(bbox = bb)

## ----eval=FALSE----------------------------------------------------------
#  identical(q, opq(bbox = 'greater london uk'))
#  ## TRUE

## ---- eval=FALSE---------------------------------------------------------
#  bb_df = getbb(place_name = "london", format_out = "data.frame")
#  bb_poly = getbb(place_name = "london", format_out = "polygon")

## ----trim-osmdata, eval = FALSE------------------------------------------
#  bb <- getbb ('greater london uk', format_out = 'polygon')
#  x <- opq(bbox = bb) %>%
#      add_osm_feature(key = 'highway', value = 'motorway') %>%
#      osmdata_sf () %>%
#      trim_osmdata (bb)

## ------------------------------------------------------------------------
get_overpass_url()
new_url <- "http://overpass.openstreetmap.ie/api/interpreter"

## ---- eval=FALSE---------------------------------------------------------
#  set_overpass_url(new_url) # reset the base url (not run)

## ---- eval=FALSE---------------------------------------------------------
#  opq_string(q)
#  ## [out:xml][timeout:25];
#  ## (
#  ##   node
#  ##     ["highway"="motorway"]
#  ##     (51.2867602,-0.510375,51.6918741,0.3340155);
#  ##   way
#  ##     ["highway"="motorway"]
#  ##     (51.2867602,-0.510375,51.6918741,0.3340155);
#  ##   relation
#  ##     ["highway"="motorway"]
#  ##     (51.2867602,-0.510375,51.6918741,0.3340155);
#  ## );
#  ## (._;>);out body;

## ----kunming1, eval = FALSE----------------------------------------------
#  q <- opq(bbox = 'Kunming, China') %>%
#      add_osm_feature(key = 'natural', value = 'water')

## ----kunming2, eval = FALSE----------------------------------------------
#  q <- opq(bbox = 'Kunming, China') %>%
#      add_osm_feature(key = 'natural', value = 'water') %>%
#      add_osm_feature(key = 'name:en', value = 'Dian', value_exact = FALSE)

## ---- echo = FALSE-------------------------------------------------------
q <- opq(bbox = c(102.5417638, 24.8915153, 102.8617638, 25.2115153)) %>%
    add_osm_feature(key = 'natural', value = 'water') %>%
    add_osm_feature(key = 'name:en', value = 'Dian', value_exact = FALSE)

## ----kunming3, eval = FALSE----------------------------------------------
#  dat1 <- opq(bbox = 'Kunming, China') %>%
#      add_osm_feature(key = 'natural', value = 'water') %>%
#      osmdata_sf ()
#  dat2 <- opq(bbox = 'Kunming, China') %>%
#      add_osm_feature(key = 'name:en', value = 'Dian', value_exact = FALSE) %>%
#      osmdata_sf ()
#  dat <- c (dat1, dat2)

## ---- eval = FALSE-------------------------------------------------------
#  unlist (lapply (dat1, nrow) [4:8])
#  unlist (lapply (dat2, nrow) [4:8])
#  unlist (lapply (dat, nrow) [4:8])

## ---- echo = FALSE-------------------------------------------------------
dat1 <- c (7373, 31, 118, 0, 10)
dat2 <- c (2254, 30, 2, 0, 1)
dat <- c (7590, 46, 119, 0, 10)
names (dat1) <- names (dat2) <- names (dat) <- c ('osm_points', 'osm_lines',
                                                  'osm_polygons',
                                                  'osm_multilines',
                                                  'osm_multipolygons')
dat <- dat [c (1:3, 5)]
dat1
dat2
dat

## ---- eval = FALSE-------------------------------------------------------
#  unlist (lapply (osmdata_sf (q), nrow) [4:8])

## ---- echo = FALSE-------------------------------------------------------
dat <- c (2029, 15, 1, 0, 1)
names (dat1) <- names (dat2) <- names (dat) <- c ('osm_points', 'osm_lines',
                                                  'osm_polygons',
                                                  'osm_multilines',
                                                  'osm_multipolygons')
dat

## ----kunming4, eval = FALSE----------------------------------------------
#  q <- opq(bbox = 'Kunming, China') %>%
#      add_osm_feature(key = 'natural', value = 'water') %>%
#      add_osm_feature(key = 'name:en', value = 'Dian', value_exact = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  q <- opq(bbox = 'Kunming, China') %>%
#      add_osm_feature(key = 'natural', value = 'water') %>%
#      add_osm_feature(key = 'name', value = 'dian', key_exact = FALSE,
#                  value_exact = FALSE, match_case = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  osmdata_sf(opq_string(q))
#  ## Object of class 'osmdata' with:
#  ##                  $bbox :
#  ##         $overpass_call : The call submitted to the overpass API
#  ##             $timestamp : [ Thurs 5 May 2017 14:33:54 ]
#  ##            $osm_points : 'sf' Simple Features Collection with 360582 points
#  ##            ...

## ---- eval=FALSE---------------------------------------------------------
#  q <- opq(bbox = 'London City, U.K.')
#  lots_of_data <- osmdata_sf(q)

## ----opq-london, eval = FALSE--------------------------------------------
#  not_so_much_data <- opq(bbox = 'city of london uk') %>%
#      add_osm_feature(key = 'highway') %>%
#      add_osm_feature(key = 'name') %>%
#      osmdata_sf()

## ----opq-seville-plot, eval = FALSE--------------------------------------
#  q1 <- opq('Sevilla') %>%
#      add_osm_feature(key = 'highway', value = 'cycleway')
#  cway_sev <- osmdata_sp(q1)
#  sp::plot(cway_sev$osm_lines)

## ----des-bike1, eval=FALSE-----------------------------------------------
#  q2 <- add_feature(q1, key = 'bicycle', value = 'designated')
#  des_bike <- osmdata_sf(q2)
#  q3 <- add_feature(q2, key = 'bridge', value = 'yes')
#  des_bike_and_bridge <- osmdata_sf(q3)
#  nrow(des_bike_and_bridge$osm_points); nrow(des_bike_and_bridge$osm_lines)
#  ## [1] 7
#  ## [1] 3

## ---- des-bike2, eval=FALSE----------------------------------------------
#  q4 <- add_feature(q1, key = 'bridge', value = 'yes')
#  bridge <- osmdata_sf(q4)
#  des_bike_or_bridge <- c(des_bike, bridge)
#  nrow(des_bike_or_bridge$osm_points); nrow(des_bike_or_bridge$osm_lines)
#  ## [1] 208
#  ## [1] 40

## ---- eval=FALSE---------------------------------------------------------
#  bridge
#  ##  Object of class 'osmdata' with:
#  ##                   $bbox : 37.3002036,-6.0329182,37.4529579,-5.819157
#  ##          $overpass_call : The call submitted to the overpass API
#  ##              $timestamp : [ Thurs 5 May 2017 14:41:19 ]
#  ##             $osm_points : 'sf' Simple Features Collection with 69 points
#  ##              $osm_lines : 'sf' Simple Features Collection with 25 linestrings
#  ##           $osm_polygons : 'sf' Simple Features Collection with 0 polygons
#  ##         $osm_multilines : 'sf' Simple Features Collection with 0 multilinestrings
#  ##      $osm_multipolygons : 'sf' Simple Features Collection with 0 multipolygons

## ----osmdata_with_files3a, eval=FALSE------------------------------------
#  class(osmdata_sf(q)$osm_lines)
#  ## [1] "sf"         "data.frame"

## ----osmdata_with_files3b, eval=FALSE------------------------------------
#  class(osmdata_sp(q)$osm_lines)
#  ## [1] "SpatialLinesDataFrame"
#  ## attr(,"package")
#  ## [1] "sp"

## ----osmdata_xml-london-buildings, eval = FALSE--------------------------
#  dat <- opq(bbox = c(-0.12, 51.51, -0.11, 51.52)) %>%
#      add_osm_feature(key = 'building') %>%
#      osmdata_xml(file = 'buildings.osm')
#  class(dat)
#  ## [1] "xml_document" "xml_node"

## ----osmdata_with_files, eval = FALSE------------------------------------
#  q <- opq(bbox = c(-0.12, 51.51, -0.11, 51.52)) %>%
#      add_osm_feature(key = 'building')
#  doc <- osmdata_xml(q, 'buildings.osm')
#  dat1 <- osmdata_sf(q, doc)
#  dat2 <- osmdata_sf(q, 'buildings.osm')
#  identical(dat1, dat2)
#  ## [1] TRUE

## ---- eval=FALSE---------------------------------------------------------
#  readLines('buildings.osm')[1:6]
#  ## [1] "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
#  ## [2] "<osm version=\"0.6\" generator=\"Overpass API\">"
#  ## [3] "  <note>The data included in this document is from www.openstreetmap.org. The data is made available under ODbL.</note>"
#  ## [4] "  <meta osm_base=\"2017-03-07T09:28:03Z\"/>"
#  ## [5] "  <node id=\"21593231\" lat=\"51.5149566\" lon=\"-0.1134203\"/>"
#  ## [6] "  <node id=\"25378129\" lat=\"51.5135870\" lon=\"-0.1115193\"/>"

## ---- eval=FALSE---------------------------------------------------------
#  dat_sp <- osmdata_sp(q, 'buildings.osm')
#  dat_sf <- osmdata_sf(q, 'buildings.osm')

## ----trentham, eval = FALSE----------------------------------------------
#  opq(bbox = 'Trentham, Australia') %>%
#      add_osm_feature(key = 'name') %>%
#      osmdata_xml(filename = 'trentham.osm')

## ----sf1, eval=FALSE-----------------------------------------------------
#  sf::st_read('trentham.osm', layer = 'points')
#  ## Reading layer `points' from data source `trentham.osm' using driver `OSM'
#  ## Simple feature collection with 38 features and 10 fields
#  ## geometry type:  POINT
#  ## dimension:      XY
#  ## bbox:           xmin: 144.2894 ymin: -37.4846 xmax: 144.3893 ymax: -37.36012
#  ## epsg (SRID):    4326
#  ## proj4string:    +proj=longlat +datum=WGS84 +no_defs

## ----osmdata_sf2, eval=FALSE---------------------------------------------
#  osmdata_sf(q, 'trentham.osm')
#  ## Object of class 'osmdata' with:
#  ##                  $bbox : -37.4300874,144.2863388,-37.3500874,144.3663388
#  ##         $overpass_call : The call submitted to the overpass API
#  ##             $timestamp : [ Thus 5 May 2017 14:42:19 ]
#  ##            $osm_points : 'sf' Simple Features Collection with 7106 points
#  ##             $osm_lines : 'sf' Simple Features Collection with 263 linestrings
#  ##          $osm_polygons : 'sf' Simple Features Collection with 38 polygons
#  ##        $osm_multilines : 'sf' Simple Features Collection with 1 multilinestrings
#  ##     $osm_multipolygons : 'sf' Simple Features Collection with 6 multipolygons

## ----object-sizes, eval=FALSE--------------------------------------------
#  s1 <- object.size(osmdata_sf(q, 'trentham.osm')$osm_points)
#  s2 <- object.size(sf::st_read('trentham.osm', layer = 'points', quiet = TRUE))
#  as.numeric(s1 / s2)
#  ## [1] 511.4193

## ---- eval=FALSE---------------------------------------------------------
#  names(sf::st_read('trentham.osm', layer = 'points', quiet = TRUE)) # the keys
#  ## [1] "osm_id"     "name"       "barrier"    "highway"
#  ## [5] "ref"        "address"    "is_in"      "place"
#  ## [9] "man_made"   "other_tags" "geometry"

## ---- eval=FALSE---------------------------------------------------------
#  names(osmdata_sf(q, 'trentham.osm')$osm_points)
#  ## [1] "osm_id"           "name"             "X_description_"   "X_waypoint_"
#  ## [5] "addr.city"        "addr.housenumber" "addr.postcode"    "addr.street"
#  ## [9] "amenity"          "barrier"          "denomination"     "foot"
#  ## [13] "ford"             "highway"          "leisure"          "note_1"
#  ## [17] "phone"            "place"            "railway"          "railway.historic"
#  ## [21] "ref"              "religion"         "shop"             "source"
#  ## [25] "tourism"          "waterway"         "geometry"

## ---- eval=FALSE---------------------------------------------------------
#  addr <- sf::st_read('trentham.osm', layer = 'points', quiet = TRUE)$address
#  all(is.na(addr))
#  ## TRUE

## ----sf_sp, eval=FALSE---------------------------------------------------
#  dat <- sf::st_read('buildings.osm', layer = 'multipolygons', quiet = TRUE)
#  dat_sp <- as(dat, 'Spatial')
#  class(dat_sp)
#  ## [1] "SpatialPolygonsDataFrame"\nattr(,"package")\n[1] "sp"

## ---- eval=FALSE---------------------------------------------------------
#  dim(dat_sp)
#  ## [1] 560  25

## ---- eval=FALSE---------------------------------------------------------
#  dim(osmdata_sp(q, doc = 'buildings.osm')$osm_polygons)
#  ## [1] 566 114

## ---- eval=FALSE---------------------------------------------------------
#  dim(osmdata_sp(q, doc = 'buildings.osm')$osm_multipolygons)
#  ## [1] 15 52

## ---- eval = FALSE-------------------------------------------------------
#  tr <- opq(bbox = 'Trentham, Australia') %>%
#      add_osm_feature(key = 'name') %>%
#      osmdata_sf()

## ---- eval=FALSE---------------------------------------------------------
#  i <- which(tr$osm_lines$name == 'Coliban River')
#  coliban <- tr$osm_lines[i, ]
#  coliban[which(!is.na(coliban))]
#  ## Simple feature collection with 1 feature and 3 fields
#  ## geometry type:  LINESTRING
#  ## dimension:      XY
#  ## bbox:           xmin: 144.3235 ymin: -37.37162 xmax: 144.3335 ymax: 37.36366
#  ## epsg (SRID):    4326
#  ## proj4string:    +proj=longlat +datum=WGS84 +no_defs
#  ##            osm_id          name waterway                       geometry
#  ## 87104907 87104907 Coliban River    river LINESTRING(144.323471069336...

## ---- eval=FALSE---------------------------------------------------------
#  coliban$geometry[[1]]
#  ## LINESTRING(144.323471069336 -37.3716201782227, 144.323944091797 -37.3714790344238, 144.324356079102 -37.3709754943848, 144.324493408203 -37.3704833984375, 144.324600219727 -37.370174407959, 144.324981689453 -37.3697204589844, 144.325149536133 -37.369441986084, 144.325393676758 -37.3690567016602, 144.325714111328 -37.3686943054199, 144.326080322266 -37.3682441711426)

## ---- eval=FALSE---------------------------------------------------------
#  pts <- osm_points(tr, rownames(coliban))
#  wf <- pts[which(pts$waterway == 'waterfall'), ]
#  wf[which(!is.na(wf))]
#  ## Simple feature collection with 1 feature and 4 fields
#  ## geometry type:  POINT
#  ## dimension:      XY
#  ## bbox:           xmin: 144.3246 ymin: -37.37017 xmax: 144.3246 ymax: -37.37017
#  ## epsg (SRID):    4326
#  ## proj4string:    +proj=longlat +datum=WGS84 +no_defs
#  ##                osm_id           name    tourism  waterway
#  ## 1013064837 1013064837 Trentham Falls attraction waterfall
#  ##                                  geometry
#  ## 1013064837 POINT(144.324600219727 -37....

## ---- eval=FALSE---------------------------------------------------------
#  mp <- osm_multipolygons(tr, rownames(wf))

## ---- echo=FALSE---------------------------------------------------------
for (f in list.files(pattern = "\\.osm"))
    if (file.exists(f)) file.remove(f)

## ---- eval = FALSE-------------------------------------------------------
#  lcnr9 <- opq ('greater london uk') %>%
#      add_osm_feature (key = "name", value = "LCN 9",
#                   value_exact = FALSE) %>%
#      osmdata_sp()
#  sp::plot(lcnr9$osm_lines)

