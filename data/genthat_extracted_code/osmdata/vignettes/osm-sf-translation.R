## ---- eval=FALSE---------------------------------------------------------
#  sf::st_read (file, layer = 'points')

## ----trentham, eval=FALSE------------------------------------------------
#  q <- opq (bbox = 'Trentham, Australia')
#  q <- add_osm_feature (q, key = 'name') # any named objects
#  osmdata_xml (q, 'trentham.osm')

## ---- eval=FALSE---------------------------------------------------------
#  names (sf::st_read ('trentham.osm', layer = 'points', quiet = TRUE))

## ---- echo=FALSE---------------------------------------------------------
c ("osm_id",     "name",       "barrier",    "highway",    "ref",
"address",    "is_in",      "place",      "man_made",   "other_tags",
"geometry")

## ---- eval=FALSE---------------------------------------------------------
#  names (osmdata_sf (q, 'trentham.osm')$osm_points)

## ---- echo=FALSE---------------------------------------------------------
c ("osm_id",           "name",             "X_description_",   "X_waypoint_",
"addr.city",        "addr.housenumber", "addr.postcode",    "addr.street",
"amenity",          "barrier",          "denomination",     "foot",
"ford",             "highway",          "leisure",          "note_1",
"phone",            "place",            "railway",  "railway.historic",
"ref",              "religion",         "shop",             "source",
"tourism",          "waterway",         "geometry")

## ---- eval=FALSE---------------------------------------------------------
#  addr <- sf::st_read ('trentham.osm', layer = 'points', quiet = TRUE)$address
#  all (is.na (addr))

## ---- echo=FALSE---------------------------------------------------------
TRUE

