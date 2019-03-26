## ----pkg-load, echo = FALSE, message = FALSE-----------------------------
library (gtfsrouter)
#devtools::load_all (".", export_all = FALSE)

## ----berlin_gtfs---------------------------------------------------------
berlin_gtfs_to_zip()
f <- file.path (tempdir (), "vbb.zip")
file.exists (f)
gtfs <- extract_gtfs (f)

## ----route1-fakey, eval = FALSE------------------------------------------
#  from <- "Innsbrucker Platz"
#  to <- "Alexanderplatz"
#  gtfs_route (gtfs, from = from, to = to)

## ----route1, eval = TRUE, echo = FALSE-----------------------------------
from <- "Innsbrucker Platz"
to <- "Alexanderplatz"
knitr::kable (gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00"))

## ----route2, eval = TRUE-------------------------------------------------
route <- gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00", day = "Sunday")

## ----timetable-----------------------------------------------------------
gtfs <- extract_gtfs (f)
from <- "Innsbrucker Platz"
to <- "Alexanderplatz"
system.time (gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00", day = "Sunday"))
names (gtfs)
gtfs <- gtfs_timetable (gtfs, day = "Sunday") # explicit pre-processing to extract timetable for Sunday
names (gtfs)
system.time (gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00"))

## ----gtfs_route_table-fakey, eval = FALSE--------------------------------
#  head (gtfs$route)

## ----gtfs_route_table, echo = FALSE--------------------------------------
knitr::kable (head (gtfs$route))

## ----route3-fakey, eval = FALSE------------------------------------------
#  gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00", day = "Sunday", route_pattern = "^S")

## ----route3, echo = FALSE, eval = TRUE-----------------------------------
knitr::kable (gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00", day = "Sunday", route_pattern = "^S"))

## ----route4a-fakey, eval = FALSE-----------------------------------------
#  from <- "Alexanderplatz"
#  to <- "Pankow"
#  gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00", day = "Sunday", earliest_arrival = FALSE)

## ----route4a, eval = TRUE, echo = FALSE----------------------------------
from <- "Alexanderplatz"
to <- "Pankow"
r1 <- gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00", day = "Sunday")
r2 <- gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00", day = "Sunday", earliest_arrival = FALSE)
knitr::kable (r2)

## ----route4b-fakey, eval = FALSE-----------------------------------------
#  gtfs_route (gtfs, from = from, to = to, start_time = "12:00:00", day = "Sunday", earliest_arrival = TRUE)

## ----route4b, eval = TRUE, echo = FALSE----------------------------------
knitr::kable (r1)
diff_arrival <- gtfsrouter:::convert_time (r2$arrival_time [nrow (r2)]) -
    gtfsrouter:::convert_time (r1$arrival_time [nrow (r1)])
diff_depart <- gtfsrouter:::convert_time (r1$departure_time [1]) -
    gtfsrouter:::convert_time (r2$departure_time [1])
mm <- floor (diff_depart / 60)
ss <- diff_depart - mm * 60
diff_depart <- paste0 (mm, "min, ", ss, "s")

diff_total <- (gtfsrouter:::convert_time (r2$arrival_time [nrow (r2)]) -
    gtfsrouter:::convert_time (r2$departure_time [1])) -
    (gtfsrouter:::convert_time (r1$arrival_time [nrow (r1)]) -
     gtfsrouter:::convert_time (r1$departure_time [1]))
mm <- floor (diff_total / 60)
ss <- diff_total - mm * 60
diff_total <- paste0 (mm, "min, ", ss, "s")

## ----home-work-fakey1, eval = FALSE--------------------------------------
#  go_home ()

## ----home-work-setup, echo = FALSE---------------------------------------
Sys.setenv ("gtfs_home" = "Innsbrucker Platz")
Sys.setenv ("gtfs_work" = "Alexanderplatz")
Sys.setenv ("gtfs_data" = file.path (tempdir (), "vbb.zip"))
process_gtfs_local () # If not already done
go_home (start_time = "12:20") # next available service

## ---- home-work-setup2, eval = FALSE-------------------------------------
#  Sys.setenv ("gtfs_home" = "<my home station>")
#  Sys.setenv ("gtfs_work" = "<my work station>")
#  Sys.setenv ("gtfs_data" = "/full/path/to/gtfs.zip")

## ---- home-work-setup3, eval = FALSE-------------------------------------
#  process_gtfs_local ()

## ----home-work-fakey2, eval = FALSE--------------------------------------
#  go_home (wait = 1)

## ----home-work2, echo = FALSE--------------------------------------------
go_home (start_time = "12:20", wait = 1)

## ----extract-again, eval = FALSE-----------------------------------------
#  berlin_gtfs_to_zip ()
#  f <- file.path (tempdir (), "vbb.zip")
#  gtfs <- extract_gtfs (f)
#  gtfs <- gtfs_timetable (gtfs, day = 3)

## ----isochrone-----------------------------------------------------------
from <- "Alexanderplatz"
start_time <- "12:05"
end_time <- "12:10"
ic <- gtfs_isochrone (gtfs,
                      from = from,
                      start_time = start_time,
                      end_time = end_time)

## ------------------------------------------------------------------------
str (ic)

## ----isochrone-exists, echo = FALSE--------------------------------------
fig_name <- "isochrone.png"
isochrone_exists <- file.exists (fig_name)

## ----isochrone-plot, eval = FALSE----------------------------------------
#  plot (ic)

## ----isochrone-mapshot, eval = !isochrone_exists, echo = FALSE-----------
#  m <- plot (ic)
#  mapview::mapshot (m, file = fig_name)

## ----isochrone-mapshot-plot, echo = FALSE, out.width = "100%"------------
knitr::include_graphics (fig_name)

