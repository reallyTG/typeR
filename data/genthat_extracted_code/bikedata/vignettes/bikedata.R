## ----install1, eval = FALSE----------------------------------------------
#  install.packages ('bikedata')

## ----install2, eval = FALSE----------------------------------------------
#  devtools::install_github ("mpadge/bikedata")

## ---- eval = TRUE--------------------------------------------------------
library (bikedata)

## ---- eval = FALSE, echo = FALSE, message = FALSE------------------------
#  devtools::load_all ()

## ----store-la-data, eval = FALSE-----------------------------------------
#  bikedb <- file.path (tempdir (), "bikedb.sqlite") # or whatever
#  dl_bikedata (city = 'la', dates = 2016, quiet = TRUE)
#  store_bikedata (data_dir = tempdir (), bikedb = bikedb, quiet = TRUE)

## ----store-la-data-dummy, echo = FALSE-----------------------------------
98138

## ---- eval = FALSE-------------------------------------------------------
#  dl_bikedata (city = 'divvy', dates = 2016, quiet = TRUE)
#  store_bikedata (bikedb = bikedb, data_dir = tempdir (), quiet = TRUE)

## ---- echo = FALSE-------------------------------------------------------
3595383

## ---- eval = FALSE-------------------------------------------------------
#  bike_db_totals (bikedb = bikedb)

## ---- echo = FALSE-------------------------------------------------------
3693521

## ---- eval = FALSE-------------------------------------------------------
#  index_bikedata_db (bikedb = bikedb)

## ---- eval = FALSE-------------------------------------------------------
#  tm <- bike_tripmat (bikedb = bikedb, city = 'la')
#  class (tm); dim (tm); sum (tm)

## ------------------------------------------------------------------------

## ---- echo = FALSE-------------------------------------------------------
x <- "matrix"; y <- c (64, 64); z <- 98138
x; y; z

## ---- eval = FALSE-------------------------------------------------------
#  bike_tripmat (bikedb = bikedb, city = 'la', long = TRUE)

## ---- echo = FALSE-------------------------------------------------------
n <- 4096
ss <- c (rep ('la3005', 10), rep (NA, n - 10))
es <- c ('la3005', 'la3006', 'la3007', 'la3008', 'la3010', 'la3011',
         'la3014', 'la3016', 'la3018', 'la3019', rep (NA, n - 10))
nt <- c (252, 93, 23, 153, 5, 63, 40, 10, 31, 36, rep (NA, n - 10))

tm <- tibble::tibble (start_station_id = ss,
                      end_station_id = es, numtrips = nt)
tm

## ---- eval = FALSE-------------------------------------------------------
#  bike_stations (bikedb = bikedb)

## ---- echo = FALSE-------------------------------------------------------
n <- 660
id <- seq (n)
city <- rep ('la', n)
ids <- c ('la3005', 'la3006', 'la3007', 'la3008', 'la3009',
          'la3010', 'la3011', 'la3013', 'la3014', 'la3016', rep (NA, n - 10))
x <- c (34.04855, 34.04554, 34.05048, 34.04661, 33.98738,
        34.03705, 34.04113, 34.05661, 34.05290, 34.04373, rep (NA, n - 10))
y <- c (-118.2590, -118.2567, -118.2546, -118.2627, -118.4728,
        -118.2549, -118.2680, -118.2372, -118.2416, -118.2601, rep (NA, n - 10))
stations1 <- tibble::tibble (id = id, city = city, stn_id = ids,
                             name = rep ('', n), longitude = x, latitude = y)
stations1

## ---- eval = FALSE-------------------------------------------------------
#  st <- bike_stations (bikedb = bikedb, city = 'ch')

## ---- eval = FALSE-------------------------------------------------------
#  bike_write_test_data ()
#  store_bikedata (bikedb = 'testdb')
#  bike_summary_stats (bikedb = 'testdb')

## ---- eval = FALSE-------------------------------------------------------
#  dl_bikedata (city = 'chicago', data_dir = '/data/bikedata/')

## ---- eval = FALSE-------------------------------------------------------
#  dl_bikedata (city = 'dc', dates = 16)

## ---- eval = FALSE-------------------------------------------------------
#  dl_bikedata (city = 'ny', dates = 201604:201608)

## ---- eval = FALSE-------------------------------------------------------
#  dl_bikedata (city = 'ny', dates = '2016/04:2016/08')
#  dl_bikedata (city = 'new york', dates = '201604:201608')
#  dl_bikedata (city = 'n.y.c.', dates = '2016-04:2016-08')
#  dl_bikedata (city = 'new', dates = '2016 Apr-Aug')

## ---- eval = FALSE-------------------------------------------------------
#  dl_bikedata (city = 'dc', dates = '2016.03-2016.05')

## ---- eval = FALSE-------------------------------------------------------
#  dl_bikedata (city = 'sf', data_dir = '/data/stored/here')

## ---- eval = FALSE-------------------------------------------------------
#  store_bikedata (city = 'sf', data_dir = '/data/stored/here', bikedb = bikedb)

## ---- eval = FALSE-------------------------------------------------------
#  bike_stored_files (bikedb = bikedb = city = 'sf')

## ---- eval = FALSE-------------------------------------------------------
#  dl_bikedata (bikedb = bikedb, city = 'ny', dates = '2014 aug - 2015 dec')
#  ntrips <- store_bikedata (bikedb = bikedb, city = 'ny',
#                            data_dir = '/data/stored/here')

## ---- eval = FALSE-------------------------------------------------------
#  dim (bike_tripmat (bikedb = bikedb, city = 'ch'))

## ---- echo = FALSE-------------------------------------------------------
c (581, 581)

## ---- eval = FALSE-------------------------------------------------------
#  dim (bike_stations (bikedb = bikedb, city = 'ch'))

## ---- echo = FALSE-------------------------------------------------------
c (596, 6)

## ---- eval = FALSE-------------------------------------------------------
#  args0 <- list (bikedb = bikedb, city = 'ny', args)
#  args1 <- list (start_date = 16, end_time = 12, weekday = 1)
#  tm <- do.call (bike_tripmat, c (args0, args1))

## ---- eval = FALSE-------------------------------------------------------
#  args1 <- list (start_date = '2016 May', end_time = '12:39', weekday = 2:6)
#  args1 <- list (end_date = 20160720, end_time = 123915, weekday = c ('mo', 'we'))
#  args1 <- list (end_date = '2016-07-20', end_time = '12:39:15', weekday = 2:6)

## ------------------------------------------------------------------------
bike_demographic_data ()

## ---- eval = FALSE-------------------------------------------------------
#  tm <- bike_tripmat (bikedb = bikedb, city = 'ny', start_date = 2016,
#          start_time = 9, end_time = 24, weekday = 2:6, gender = 'xx',
#          birth_year = 1900:1950)

## ---- eval = FALSE-------------------------------------------------------
#  bike_stations (bikedb = bikedb)

## ---- echo = FALSE-------------------------------------------------------
stations1

## ---- eval = FALSE-------------------------------------------------------
#  bike_stations (bikedb = bikedb, city = 'ch')

## ---- echo = FALSE-------------------------------------------------------
n <- 596
id <- 66 + seq (n)
city <- rep ('ch', n)
ids <- c ('ch456', 'ch101', 'ch109', 'ch21', 'ch80',
          'ch346', 'ch341', 'ch444', 'ch511', 'ch376', rep (NA, n - 10))
nms <- c ('2112 W Peterson Ave', '63rd St Beach', '900 W Harrison St',
            'Aberdeen St & Jackson Blvd', 'Aberdeen St & Monroe St', 
            'Ada St & Washington Blvd', 'Adler Planetarium', 
            'Albany Ave & 26th St', 'Albany Ave & Bloomingdale Ave', 
            'Artesian Ave & Hubbard St', rep (NA, n - 10))
x <- c (-87.68359, -87.57612, -87.65002, -87.65479, -87.65393,
        -87.66121, -87.60727, -87.70201, -87.70513, -87.68822, rep (NA, n - 10))
y <- c (41.99118, 41.78102, 41.87468, 41.87773, 41.88046,
        41.88283, 41.86610, 41.84448, 41.91403, 41.88949, rep (NA, n - 10))
stations2 <- tibble::tibble (id = id, city = city, stn_id = ids,
                             name = nms, longitude = x, latitude = y)
stations2

## ---- eval = FALSE-------------------------------------------------------
#  bike_summary_stats (bikedb)

## ---- echo = FALSE-------------------------------------------------------
ntr <- c (3693521, 3595383, 98138)
nst <- c (662, 596, 66)
startd <- c ('2016-01-01 00:07:00', '2016-01-01 00:07:00', 
             '2016-07-07 04:17:00')
endd <- rep ('2016-12-31 23:57:52', 3)
fls <- c (NA, TRUE, TRUE)
tbl <- tibble::tibble (city = c ("total", "ch", "la"),
                       num_trips = ntr, num_stations = nst,
                       first_trip = as.factor (startd), 
                       last_trip = as.factor (endd), latest_files = fls)
tbl

## ---- eval = FALSE-------------------------------------------------------
#  bike_db_totals (bikedb = bikedb)

## ---- echo = FALSE-------------------------------------------------------
3693521

## ---- eval = FALSE-------------------------------------------------------
#  bike_db_totals (bikedb = bikedb, city = "ch")

## ---- echo = FALSE-------------------------------------------------------
3595383

## ---- eval = FALSE-------------------------------------------------------
#  bike_db_totals (bikedb = bikedb, city = "la")

## ---- echo = FALSE-------------------------------------------------------
93138

## ---- eval = FALSE-------------------------------------------------------
#  bike_db_totals (bikedb = bikedb, trips = FALSE)

## ---- echo = FALSE-------------------------------------------------------
660

## ---- eval = FALSE-------------------------------------------------------
#  bike_db_totals (bikedb = bikedb, trips = FALSE, city = "ch")

## ---- echo = FALSE-------------------------------------------------------
596

## ---- eval = FALSE-------------------------------------------------------
#  bike_db_totals (bikedb = bikedb, trips = FALSE, city = "la")

## ---- echo = FALSE-------------------------------------------------------
64

## ---- eval = FALSE-------------------------------------------------------
#  bike_datelimits (bikedb = bikedb)

## ---- echo = FALSE-------------------------------------------------------
c ('first' = "2016-01-01 00:07:00", 'last' = "2016-12-31 23:57:52")

## ---- eval = FALSE-------------------------------------------------------
#  bike_datelimits (bikedb = bikedb, city = 'ch')

## ------------------------------------------------------------------------
c ('first' = "2016-01-01 00:07:00", 'last' = "2016-12-31 23:57:52")

## ---- eval = FALSE-------------------------------------------------------
#  bike_latest_files (bikedb = bikedb)

## ------------------------------------------------------------------------
c ('la' = TRUE, 'ch' = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  bike_daily_trips (bikedb = bikedb, city = 'ch')

## ---- echo = FALSE-------------------------------------------------------
n <- 366
dates <- c ('2016-01-01', '2016-01-02', '2016-01-03', '2016-01-04',
            '2016-01-05', '2016-01-06', '2016-01-07', '2016-01-08',
            '2016-01-09', '2016-01-10', rep (NA, n - 10))
nt <- c (935, 1421, 1399, 3833, 4189, 4608, 5028, 3425, 1733, 993,
         rep (NA, n - 10))
tibble::tibble (date = dates, numtrips = nt)

## ---- eval = FALSE-------------------------------------------------------
#  bike_daily_trips (bikedb = bikedb, city = 'ch', standardise = TRUE)

## ---- echo = FALSE-------------------------------------------------------
nt <- c (2468.925, 2481.939, 2200.766, 5509.787, 5884.207, 6298.229, 6630.111,
         4476.455, 2265.021, 1297.845, rep (NA, n - 10))
tibble::tibble (date = dates, numtrips = nt)

## ---- eval = FALSE-------------------------------------------------------
#  db <- dplyr::src_sqlite (bikedb, create=F)
#  dplyr::src_tbls (db)

## ------------------------------------------------------------------------
c ("datafiles", "stations", "trips")

## ---- eval = FALSE-------------------------------------------------------
#  dplyr::collect (dplyr::tbl (db, 'datafiles'))

## ---- echo = FALSE-------------------------------------------------------
city <- c ('la', 'la', 'la', 'ch', 'ch')
nms <- c ('la_metro_gbfs_trips_Q1_2017.zip', 'MetroBikeShare_2016_Q3_trips.zip',
          'Metro_trips_Q4_2016.zip', 'Divvy_Trips_2016_Q1Q2.zip',
          'Divvy_Trips_2016_Q3Q4.zip')
tibble::tibble (id = 0:4, city = city, name = nms)

## ---- eval = FALSE-------------------------------------------------------
#  dplyr::collect (dplyr::tbl (db, 'stations'))

## ---- echo = FALSE-------------------------------------------------------
stations1

## ---- eval = FALSE-------------------------------------------------------
#  dplyr::collect (dplyr::tbl (db, 'trips'))

## ---- echo = FALSE-------------------------------------------------------
n <- 3693511
id <- seq (n)
city <- rep ('la', n)
dur <- c (180, 1980, 300, 10860, 420, 780, 600, 600, 2880, 960,
          rep (NA, n - 10))
st <- c ('2016-01-01 00:15:00', '2016-01-01 00:24:00', '2016-01-01 00:28:00',
         '2016-01-01 00:38:00', '2016-01-01 00:38:00', '2016-01-01 00:39:00',
         '2016-01-01 00:43:00', '2016-01-01 00:56:00', '2016-01-01 00:57:00',
         '2016-01-01 01:54:00', rep (NA, n - 10))
et <- c ('2017-01-01 00:23:00', '2017-01-01 00:36:00', '2017-01-01 00:45:00',
         '2017-01-01 00:43:00', '2017-01-01 00:43:00', '2017-01-01 00:59:00',
         '2017-01-01 00:55:00', '2017-01-01 01:44:00', '2017-01-01 01:44:00',
         '2017-01-01 02:19:00', rep (NA, n - 10))
nachr <- rep ('a', n)
naint <- rep (1L, n)
tibble::tibble (id = id, city = city, trip_duration = dur,
                start_time = st, stop_time = et,
                start_station_id = nachr, end_station_id = nachr,
                bike_id = nachr, user_type = nachr, birth_year = naint,
                gender = naint)

## ---- eval = FALSE-------------------------------------------------------
#  db <- RSQLite::dbConnect(RSQLite::SQLite(), bikedb, create = FALSE)
#  qry <- "SELECT stn_id, name FROM stations WHERE city = 'ch'"
#  stns <- RSQLite::dbGetQuery(db, qry)
#  RSQLite::dbDisconnect(db)
#  head (stns)

## ---- echo = FALSE-------------------------------------------------------
data.frame (stn_id = c ('ch456', 'ch101', 'ch109', 'ch21', 'ch80', 'ch346'),
            name = c ('2112 W Peterson Ave', '63rd St Beach', 
                      '900 W Harrison St', 'Aberdeen St & Jackson Blvd', 
                      'Aberdeen St & Monroe St', 'Ada St & Washington Blvd'))

## ----plot-la-out, echo = TRUE, eval = FALSE------------------------------
#  stns <- bike_stations (bikedb = bikedb, city = 'la')
#  ntrips <- bike_tripmat (bikedb = bikedb, city = 'la', long = TRUE)
#  x1 <- stns$longitude [match (ntrips$start_station_id, stns$stn_id)]
#  y1 <- stns$latitude [match (ntrips$start_station_id, stns$stn_id)]
#  x2 <- stns$longitude [match (ntrips$end_station_id, stns$stn_id)]
#  y2 <- stns$latitude [match (ntrips$end_station_id, stns$stn_id)]
#  # Set plot area to central region of bike system
#  xlims <- c (-118.27, -118.23)
#  ylims <- c (34.02, 34.07)
#  plot (stns$longitude, stns$latitude, xlim = xlims, ylim = ylims)
#  cols <- rainbow (100)
#  nt <- ceiling (ntrips$numtrips * 100 / max (ntrips$numtrips))
#  for (i in seq (x1))
#      lines (c (x1 [i], x2 [i]), c (y1 [i], y2 [i]), col = cols [nt [i]],
#          lwd = ntrips$numtrips [i] * 10 / max (ntrips$numtrips))

## ----get-la-highways, eval = FALSE---------------------------------------
#  library (magrittr)
#  xlims_la <- range (stns$longitude, na.rm = TRUE)
#  ylims_la <- range (stns$latitude, na.rm = TRUE)
#  # expand those limits slightly
#  ex <- 0.1
#  xlims_la <- xlims_la + c (-ex, ex) * diff (xlims_la)
#  ylims_la <- ylims_la + c (-ex, ex) * diff (ylims_la)
#  bbox <- c (xlims_la [1], ylims_la [1], xlims_la [2], ylims_la [2])
#  bbox <- c (xlims [1], xlims [2], ylims [1], ylims [2])
#  # Then the actual osmdata query to extract all OpenStreetMap highways
#  highways <- osmdata::opq (bbox = bbox) %>%
#      osmdata::add_osm_feature (key = 'highway') %>%
#      osmdata::osmdata_sp (quiet = FALSE)

## ----convert-stns-to-spdf, eval = FALSE----------------------------------
#  stns_tbl <- bike_stations (bikedb = bikedb)
#  stns <- sp::SpatialPointsDataFrame (coords = stns_tbl[,c('longitude','latitude')],
#                                      proj4string = sp::CRS("+init=epsg:4326"),
#                                      data = stns_tbl)
#  stns <- sp::spTransform (stns, highways$osm_lines@proj4string)

## ----map-stns-to-streetnet, eval = FALSE---------------------------------
#  la_net <- stplanr::SpatialLinesNetwork (sl = highways$osm_lines)
#  # Find the closest node to each station
#  nodeid <- stplanr::find_network_nodes (la_net, stns$longitude, stns$latitude)
#  # Convert start and end station IDs in trips table to node IDs in `la_net`
#  startid <- nodeid [match (ntrips$start_station_id, stns$stn_id)]
#  endid <- nodeid [match (ntrips$end_station_id, stns$stn_id)]
#  ntrips$start_station_id <- startid
#  ntrips$end_station_id <- endid

## ---- eval = FALSE-------------------------------------------------------
#  bike_usage <- stplanr::sum_network_links (la_net, data.frame (ntrips))

## ----plot-tmat, eval = FALSE---------------------------------------------
#  tmap::tm_shape (bike_usage, xlim = xlims, ylim = ylims, is.master=TRUE) +
#      tmap::tm_lines (col="numtrips", lwd="numtrips", title.col = "Number of trips",
#                      breaks = c(0, 200, 400, 600, 800, 1000, Inf),
#                      legend.lwd.show = FALSE, scale = 5) +
#      tmap::tm_layout (bg.color="gray95", legend.position = c ("right", "bottom"),
#                       legend.bg.color = "white", legend.bg.alpha = 0.5)
#  #tmap::save_tmap (filename = "la_map.png")

