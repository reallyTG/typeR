## ---- eval=FALSE---------------------------------------------------------
#  library(getCRUCLdata)
#  
#  CRU_data <- get_CRU_df(pre = TRUE,
#                         pre_cv = TRUE,
#                         rd0 = TRUE,
#                         tmp = TRUE,
#                         dtr = TRUE,
#                         reh = TRUE,
#                         tmn = TRUE,
#                         tmx = TRUE,
#                         sunp = TRUE,
#                         frs = TRUE,
#                         wnd = TRUE,
#                         elv = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  t <- get_CRU_df(tmp = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  if (!require("ggplot2")) {
#    install.packages(ggplot2)
#  }
#  if (!require("viridis")) {
#    install.packages("viridis")
#  }
#  
#  library(ggplot2)
#  library(viridis)

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(data = t, aes(x = lon, y = lat)) +
#    geom_raster(aes(fill = tmp)) +
#    scale_fill_viridis(option = "inferno") +
#    coord_quickmap() +
#    ggtitle("Global Mean Monthly Temperatures 1961-1990") +
#    facet_wrap(~ month, nrow = 4)

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(data = t, aes(x = month, y = tmp)) +
#    geom_violin() +
#    ylab("Temperature (˚C)") +
#    labs(title = "Global Monthly Mean Land Surface Temperatures From 1960-1991",
#         subtitle = "Excludes Antarctica")

## ---- eval=FALSE---------------------------------------------------------
#  library(readr)
#  
#  write_csv(t, path = "~/CRU_tmp.csv")
#  

## ---- eval = FALSE-------------------------------------------------------
#  CRU_stack <- get_CRU_stack(pre = TRUE,
#                             pre_cv = TRUE,
#                             rd0 = TRUE,
#                             tmp = TRUE,
#                             dtr = TRUE,
#                             reh = TRUE,
#                             tmn = TRUE,
#                             tmx = TRUE,
#                             sunp = TRUE,
#                             frs = TRUE,
#                             wnd = TRUE,
#                             elv = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  t <- create_CRU_stack(tmp = TRUE, dsn = "~/Downloads")

## ---- eval=FALSE---------------------------------------------------------
#  library(raster)
#  
#  plot(t[[1]])

## ---- eval=FALSE---------------------------------------------------------
#  plot(t[[2]]$jul)

## ---- eval=FALSE---------------------------------------------------------
#  library(raster)
#  
#  dir.create(file.path("~/Data"), showWarnings = FALSE)
#  writeRaster(
#    t$tmn,
#    filename = file.path("~/Data/tmn_", names(t$tmn)),
#    bylayer = TRUE,
#    format = "GTiff"
#    )
#  
#    writeRaster(
#    t$tmx,
#    filename = file.path("~/Data/tmx_", names(t$tmn)),
#    bylayer = TRUE,
#    format = "GTiff"
#    )

## ---- eval=FALSE---------------------------------------------------------
#  tmn_tmx <- get_CRU_stack(tmn = TRUE,
#                           tmx = TRUE,
#                           cache = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  t <- create_CRU_df(tmp = TRUE, dsn = "~/Downloads")

