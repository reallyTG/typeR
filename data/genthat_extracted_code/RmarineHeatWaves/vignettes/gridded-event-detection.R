## ----global_options, include = FALSE-------------------------------------
knitr::opts_chunk$set(fig.width = 4, fig.align = 'center',
                      echo = FALSE, warning = FALSE, 
                      message = FALSE, tidy = FALSE)

## ----load-pkg, echo = FALSE, eval = FALSE--------------------------------
#  library(RmarineHeatWaves)
#  library(ncdf4)
#  library(plyr)
#  library(dplyr)
#  library(tibble)
#  library(reshape2)
#  library(lubridate)
#  library(ggplot2)
#  library(doMC); doMC::registerDoMC(cores = 4)

## ----read-netcdf, echo = TRUE, eval = FALSE------------------------------
#  nc <- nc_open("/Users/ajsmit/spatial/OISSTv2/daily/OISST-V2-AVHRR_agg.nc")
#  # print(nc)
#  sst <- ncvar_get(nc, varid = "sst") # reads in the only var in netCDF file
#  dimnames(sst) <- list(lon = nc$dim$lon$vals,
#                        lat = nc$dim$lat$vals,
#                        t = nc$dim$time$vals)

## ----sst-df, echo = TRUE, eval = FALSE-----------------------------------
#  sst <- as_tibble(melt(sst, value.name = "temp"))
#  sst$t <- as.Date(sst$t, origin = '1978-01-01')

## ----remove-NA, echo = TRUE, eval = FALSE--------------------------------
#  sst1 <- sst %>%
#    na.omit()
#  rm(sst); rm(nc)

## ----detect-fun, echo = TRUE, eval = FALSE-------------------------------
#  OISST_detect <- function(dat) {
#    dat <- dat[,3:4]
#    start = "1983-01-01"
#    end = "2012-12-31"
#    whole <- make_whole(dat)
#    mhw <- detect(whole, climatology_start = start, climatology_end = end,
#                  min_duration = 5, max_gap = 2, cold_spells = FALSE)
#    events <- mhw$event
#    return(events)
#    }

## ----apply-detect-fun, echo = TRUE, eval = FALSE-------------------------
#  # it takes a long time...
#  system.time(OISST_events <- ddply(sst1, .(lon, lat), OISST_detect, .parallel = TRUE))
#   #   user  system elapsed
#   # 1862.3   205.9   704.8
#  save(OISST_events, file = "/Users/ajsmit/spatial/OISSTv2/MHWs/OISST_events.Rdata")

## ----load-SST, echo = TRUE, eval = FALSE---------------------------------
#  # in case it was calculated and saved earlier, we can load it here now:
#  load("/Users/ajsmit/spatial/OISSTv2/MHWs/OISST_events.Rdata")

## ----event-tally, echo = TRUE, eval = FALSE------------------------------
#  # summarise the number of unique longitude, latitude and year combination:
#  event_freq <- OISST_events %>%
#    mutate(year = year(date_start)) %>%
#    group_by(lon, lat, year) %>%
#    summarise(n = n())
#  head(event_freq)
#  
#  # create complete grid for merging with:
#  sst.grid <- sst1 %>%
#    select(lon, lat, t) %>%
#    mutate(t = lubridate::year(t)) %>%
#    unique() # slow...
#  colnames(sst.grid)[colnames(sst.grid) == 't'] <- 'year'
#  
#  # and merge:
#  OISST_n <- left_join(sst.grid, event_freq)
#  OISST_n[is.na(OISST_n)] <- 0

## ----trend-fun, echo = TRUE, eval = FALSE--------------------------------
#  lin_fun <- function(ev) {
#    mod1 <- glm(n ~ year, family = poisson(link = "log"), data = ev)
#    # mod1 <- lm(n ~ year, data = ev)
#    tr <- summary(mod1)$coefficients[2,c(1,4)] # extract slope coefficient and its p-value
#    return(tr)
#  }

## ----apply-trend-fun, echo = TRUE, eval = FALSE--------------------------
#  OISST_nTrend <- ddply(OISST_n, .(lon, lat), lin_fun)
#  OISST_nTrend$pval <- cut(OISST_nTrend[,4], breaks = c(0, 0.001, 0.01, 0.05, 1))
#  head(OISST_nTrend)

## ----load-geography, echo = TRUE, eval = FALSE---------------------------
#  ## Coastline of African continent and some borders:
#  load("/Users/ajsmit/Dropbox/repos/Trend_Analysis/graph/africa_coast.RData")
#  load("/Users/ajsmit/Dropbox/repos/Trend_Analysis/graph/africa_borders.Rdata")
#  load("/Users/ajsmit/Dropbox/repos/Trend_Analysis/graph/south_africa_coast.RData")
#  load("/Users/ajsmit/Dropbox/repos/Trend_Analysis/graph/sa_provinces_new.RData")

## ----the-figure, echo = TRUE, eval = FALSE-------------------------------
#  ggplot(OISST_nTrend, aes(x = lon, y = lat)) +
#    geom_rect(size = 0.2, fill = NA,
#         aes(xmin = lon - 0.1, xmax = lon + 0.1, ymin = lat - 0.1, ymax = lat + 0.1,
#             colour = OISST_nTrend[,5])) +
#    geom_raster(aes(fill = Estimate), interpolate = FALSE, alpha = 0.9) +
#    scale_fill_gradient2(name = "Count\n per\n year", high = "red", mid = "white",
#                         low = "darkblue", midpoint = 0) +
#    scale_colour_manual(breaks = c("(0,0.001]", "(0.001,0.01]", "(0.01,0.05]", "(0.05,1]"),
#                        values = c("firebrick1", "firebrick2", "firebrick3", "white"),
#                        name = "p-value", guide = FALSE) +
#    geom_polygon(data = south_africa_coast, aes(x = lon, y = lat, group = group),
#                 colour = NA, fill = "grey80") +
#    geom_path(data = africa_borders, aes(x = lon, y = lat, group = group),
#              size = 0.3, colour = "black") +
#    geom_polygon(data = south_africa_coast, aes(x = lon, y = lat, group = group),
#                 size = 0.5, colour = "black", fill = NA) +
#    coord_fixed(ratio = 1, xlim = c(12.12, 35.12), ylim = c(-26.88, -37.38), expand = TRUE) +
#    theme_bw()
#  ggsave(file = "README-grid-example1.png", width = 6, height = 3.2)
#  
#  ggplot(OISST_nTrend, aes(lon, lat)) +
#    geom_raster(aes(fill = pval), interpolate = FALSE) +
#    scale_fill_manual(breaks = c("(0,0.001]", "(0.001,0.01]", "(0.01,0.05]",
#                                 "(0.05,0.1]", "(0.1,0.5]", "(0.5,1]"),
#                      values = c("black", "grey20", "grey40",
#                                 "grey80", "grey90", "white"),
#                      name = "p-value") +
#    geom_polygon(data = south_africa_coast, aes(x = lon, y = lat, group = group),
#                 colour = NA, fill = "grey80") +
#    geom_path(data = africa_borders, aes(x = lon, y = lat, group = group),
#              size = 0.3, colour = "black") +
#    geom_polygon(data = south_africa_coast, aes(x = lon, y = lat, group = group),
#                 size = 0.5, colour = "black", fill = NA) +
#    coord_fixed(ratio = 1, xlim = c(12.12, 35.12), ylim = c(-26.88, -37.38), expand = TRUE) +
#    theme_bw()
#  ggsave(file = "README-grid-example2.png", width = 6, height = 3.2)

