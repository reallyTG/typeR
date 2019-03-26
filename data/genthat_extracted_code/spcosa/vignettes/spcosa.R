## ---- echo=FALSE---------------------------------------------------------

# source: setup.R in rgl-package (by Duncan Murdoch)
library(rgl)
options(rgl.useNULL=TRUE)

hook_webgl <- local({
  commonParts <- TRUE
  function (before, options, envir) 
  {
    if (before || rgl::rgl.cur() == 0 || !requireNamespace("knitr")) 
      return()
    out_type <- knitr::opts_knit$get("out.format")
    if (!length(intersect(out_type, c("markdown", "html"))))       
      stop("hook_webgl is for HTML only.  Use knitr::hook_rgl instead.")
    
    name <- tempfile("webgl", tmpdir = ".", fileext = ".html")
    on.exit(unlink(name))
    dpi <- 96 # was options$dpi
    rgl::par3d(windowRect = dpi * c(0, 0, options$fig.width, 
                                          options$fig.height))
    Sys.sleep(0.1)
    prefix = gsub("[^[:alnum:]]", "_", options$label)
    prefix = sub("^([^[:alpha:]])", "_\\1", prefix)
    rgl::writeWebGL(dir = dirname(name), 
                    filename = name, 
                    snapshot = !rgl.useNULL(),
                    template = NULL, 
                    prefix = prefix, 
                    commonParts = commonParts)
    if (!isTRUE(options$rgl.keepopen) && rgl.cur())
      rgl.close()
    commonParts <<- FALSE
    res <- readLines(name)
    res <- res[!grepl("^\\s*$", res)]
    paste(gsub("^\\s+", "", res), collapse = "\n")
  }
})

knitr::knit_hooks$set(rgl = hook_webgl)  
knitr::opts_chunk$set(comment = NA)
set.seed(314)

## ----  echo=FALSE--------------------------------------------------------
# internal function for simulating data
do_fieldwork <-
function(x, composite = FALSE, n = NULL) {
    
    # load gstat
    if (suppressWarnings(!require(gstat))) {
        stop("package gstat not found", call. = FALSE)
    }

    # convert data to the unit square
    sUnitCube <- data.frame(
        s1 = (x[[1]] - min(x)) / (max(x) - min(x)),
        s2 = (x[[2]] - min(x)) / (max(x) - min(x))
    )
    coordinates(sUnitCube) <- names(sUnitCube)

    # unconditional Gaussian simulation
    sim <- krige(
        dummy ~ 1,
        locations = NULL,
        newdata = sUnitCube,
        model = vgm(
            psill = 1,
            model = "Exp",
            range = 0.1,
            nugget = 0.0
        ),
        beta = 0,
        nsim = 1,
        dummy = TRUE,
        debug.level = 0
    )

    # convert simulated data to clay on soil organic matter contents
    sim <- as(sim, "data.frame")$sim1
    sim <- (sim - min(sim)) / (max(sim)- min(sim))
    dat <- data.frame(
        clay = 10 * sim + 5.0, # mean = 10.0
        SOM  =  5 * sim + 2.5 + rnorm(n = length(sim), mean = 0, sd = 0.3) # mean 5.0
    )

    # handle composite data
    if (composite) {
        dat <- aggregate(
            x = dat[, c("clay", "SOM")],
            by = list(id = rep(x = seq_len(n), length = length(sim))),
            FUN = mean
        )
        dat$id <- NULL
    }

    # return result
    dat$clay <- round(dat$clay, digits = 1)
    dat$SOM  <- round(dat$SOM,  digits = 1)
    dat
}

## ------------------------------------------------------------------------
library(spcosa)

## ------------------------------------------------------------------------
library(ggplot2)

## ------------------------------------------------------------------------
set.seed(314)

## ---- message=FALSE------------------------------------------------------
library(rgdal)
filename <- system.file("maps", "demoGrid.asc", package = "spcosa")
ascii_grid <- readGDAL(fname = filename, silent = TRUE)

## ------------------------------------------------------------------------
stratification <- stratify(ascii_grid, nStrata = 75, nTry = 10)

## ---- fig.width=7, fig.height=4, out.width=500---------------------------
plot(stratification)

## ---- fig.width=7, fig.height=4, out.width=500---------------------------
plot(stratification) +
    scale_x_continuous(name = "Easting (km)") +
    scale_y_continuous(name = "Northing (km)")

## ------------------------------------------------------------------------
sampling_pattern <- spsample(stratification)

## ---- fig.width=7, fig.height=4, out.width=500---------------------------
plot(sampling_pattern)

## ---- fig.width=7, fig.height=4, out.width=500---------------------------
plot(stratification, sampling_pattern)

## ------------------------------------------------------------------------
sampling_points <- as(sampling_pattern, "data.frame")
head(sampling_points)

## ---- echo=FALSE---------------------------------------------------------
my_data <- do_fieldwork(sampling_points)

## ------------------------------------------------------------------------
head(my_data)

## ------------------------------------------------------------------------
#sp_data <- data.frame(sampling_points, my_data)
#coordinates(sp_data) <- ~ x * y
sp_data <- SpatialPointsDataFrame(coords = sampling_points, data = my_data)

## ---- fig.width=7, fig.height=5, out.width=400---------------------------
sample_variogram <- variogram(clay ~ 1, sp_data)
variogram_model <- fit.variogram(sample_variogram, 
    model = vgm(psill = 1, model = "Exp", range = 5, nugget = 0))
plot(sample_variogram, model = variogram_model)

## ------------------------------------------------------------------------
g <- gstat(id = "clay", formula = clay ~ 1, data = sp_data, model = variogram_model)
y_hat <- predict(g, newdata = ascii_grid)

## ---- fig.width=8, fig.height=4, out.width=450, echo=FALSE---------------
ggplot(data = as(y_hat, "data.frame")) +
    geom_raster(mapping = aes(x = x, y = y, fill = clay.pred)) +
    coord_equal()
ggplot(data = as(y_hat, "data.frame")) +
    geom_raster(mapping = aes(x = x, y = y, fill = clay.var)) +
    coord_equal()

## ---- echo=FALSE---------------------------------------------------------
prior_points <- spsample(ascii_grid, n = 50, type = "random")
prior_points <- as(prior_points, "data.frame")
names(prior_points) <- c("x", "y")
prior_points <- as.data.frame(lapply(X = prior_points, FUN = round, digits = 1))

## ------------------------------------------------------------------------
head(prior_points)

## ------------------------------------------------------------------------
coordinates(prior_points) <- ~ x * y
stratification <- stratify(ascii_grid, priorPoints = prior_points, nStrata = 75, nTry = 100)
sampling_pattern <- spsample(stratification)

## ---- fig.width=7, fig.height=4, out.width=500---------------------------
plot(stratification, sampling_pattern)

## ---- echo=FALSE---------------------------------------------------------
sampling_points <- as(sampling_pattern, "data.frame")
my_data <- do_fieldwork(sampling_points)
sp_data <- data.frame(sampling_points, my_data["clay"])
coordinates(sp_data) <- ~ x * y

## ---- fig.width=7, fig.height=5, out.width=400---------------------------
sample_variogram <- variogram(clay~1, sp_data)
variogram_model <- fit.variogram(sample_variogram,
    model = vgm(psill = 1, model = "Exp", range = 1, nugget = 0))
plot(sample_variogram, model = variogram_model)

## ------------------------------------------------------------------------
g <- gstat(id = "clay", formula = clay ~ 1, data = sp_data, model = variogram_model)
y_hat <- predict(g, newdata = ascii_grid)

## ---- fig.width=7, fig.height=4, out.width=450, echo=FALSE---------------
ggplot(data = as(y_hat, "data.frame")) +
    geom_raster(mapping = aes(x = x, y = y, fill = clay.pred)) +
    coord_equal()
ggplot(data = as(y_hat, "data.frame")) +
    geom_raster(mapping = aes(x = x, y = y, fill = clay.var)) +
    coord_equal()

## ------------------------------------------------------------------------
stratification <- stratify(ascii_grid, nStrata = 25, nTry = 10)

## ---- fig.width=7, fig.height=4, out.width=500---------------------------
plot(stratification)

## ------------------------------------------------------------------------
sampling_pattern <- spsample(stratification, n = 2)

## ---- fig.width=7, fig.height=4, out.width=500---------------------------
plot(stratification, sampling_pattern)

## ------------------------------------------------------------------------
sampling_points <- as(sampling_pattern, "data.frame")
head(sampling_points)

## ---- echo=FALSE---------------------------------------------------------
my_data <- do_fieldwork(sampling_points)

## ------------------------------------------------------------------------
estimate("spatial mean", stratification, sampling_pattern, my_data)

## ------------------------------------------------------------------------
estimate("standard error", stratification, sampling_pattern, my_data)

## ------------------------------------------------------------------------
scdf <- estimate("scdf", stratification, sampling_pattern, my_data)

## ------------------------------------------------------------------------
lapply(X = scdf, FUN = head, n = 4)
lapply(X = scdf, FUN = tail, n = 4)

## ---- fig.width=6, fig.height=5, out.width=400, echo=FALSE---------------
tmp <- as.data.frame(scdf$clay)
tmp$value <- tmp$value * 0.01
dx <- mean(diff(tmp$value))
dat <- data.frame(
    x = c(tmp$value[1] - dx, tmp$value),
    xend = c(tmp$value, tmp$value[nrow(tmp)]+ dx),
    yend =  c(tmp$cumFreq, 1)
)
ggplot() +
    geom_segment(data = dat, mapping = aes(x = x, y = yend, xend = xend, yend = yend)) +
    geom_point(data = dat[-1, ], mapping = aes(x = x, y = yend), shape = 16) +
        scale_x_continuous(name = "x : clay content (g/dag)") +
        scale_y_continuous(name = "cumulative frequency")
tmp <-  unique(as.data.frame(scdf$SOM))
tmp$value <- tmp$value * 0.01
dx <- mean(diff(tmp$value))
dat <- data.frame(
    x = c(tmp$value[1] - dx, tmp$value),
    xend = c(tmp$value, tmp$value[nrow(tmp)]+ dx),
    yend =  c(tmp$cumFreq, 1)
)
ggplot() +
    geom_segment(data = dat, mapping = aes(x = x, y = yend, xend = xend, yend = yend)) +
    geom_point(data = dat[-1, ], mapping = aes(x = x, y = yend), shape = 16) +
    scale_x_continuous(name = "x : soil organic matter content (g/dag)") +
    scale_y_continuous(name = "cumulative frequency")

## ------------------------------------------------------------------------
directory <- system.file("maps", package = "spcosa")
shp_farmsum <- readOGR(dsn = directory, layer = "farmsum", verbose = FALSE)

## ---- fig.width=6, fig.height=6, out.width=400---------------------------
stratification <- stratify(shp_farmsum, nStrata = 20, equalArea = TRUE, nTry = 10)
plot(stratification)

## ---- fig.width=6, fig.height=6, out.width=400---------------------------
sampling_pattern <- spsample(stratification, n = 2, type = "composite")
plot(stratification, sampling_pattern)

## ------------------------------------------------------------------------
sampling_points <- as(sampling_pattern, "data.frame")
head(sampling_points)

## ---- echo=FALSE---------------------------------------------------------
my_data <- do_fieldwork(sampling_points, composite = TRUE, n = 2)

## ------------------------------------------------------------------------
estimate("spatial mean", stratification, sampling_pattern, my_data)
estimate("standard error", stratification, sampling_pattern, my_data)

## ------------------------------------------------------------------------
sampling_pattern <- spsample(stratification, n = 2)
sampling_points <- as(sampling_pattern, "data.frame")
head(sampling_points)

## ---- fig.width=6, fig.height=6, out.width=400---------------------------
plot(stratification, sampling_pattern)

## ------------------------------------------------------------------------
grd <- expand.grid(
    longitude = seq(from = -176, to = 180, by = 4),
    latitude  = seq(from =  -86, to =  86, by = 4)
)
gridded(grd) <-  ~ longitude * latitude

grd_crs <- grd
proj4string(grd_crs) <- CRS("+proj=longlat +ellps=WGS84")


## ------------------------------------------------------------------------
strata     <- stratify(grd,     nStrata = 50)
strata_crs <- stratify(grd_crs, nStrata = 50)

## ---- fig.width=8, fig.height=5, out.width=500---------------------------
plot(strata)
plot(strata_crs)

## ---- echo=FALSE---------------------------------------------------------
# internal function for converting LatLong to XYZ format (r: radius of the earth in km)
.latLongToXYZ <-
function(x, r = 6378.1) {
    x <- within(x, {
        latitude  <- latitude  * pi / 180
        longitude <- longitude * pi / 180
    })
    within(x, {
        x <- r * cos(latitude) * cos(longitude)
        y <- r * cos(latitude) * sin(longitude)
        z <- r * sin(latitude)
    })
}

# function for plotting sampling points and strata in 3D
plot3dXYZ <-
function(x) {

    # get cell size
    cellSize <- spcosa:::getCellSize(x)[1]

    # coerce to data.frame
    x <- as(x, "data.frame")

    # construct quads
    M <- cbind(
        c(-1, -1,  1, 1), 
        c( 1, -1, -1, 1)
    )
    tmp1 <- NULL
    for (i in 1:nrow(M)) {
        tmp2 <- x
        tmp2$longitude <- tmp2$longitude + 0.5 * cellSize * M[i, 1]
        tmp2$latitude  <- tmp2$latitude  + 0.5 * cellSize * M[i, 2]
        tmp1 <- rbind(tmp1, cbind(id = i + nrow(M) * (seq_len(nrow(tmp2)) - 1), tmp2))
    }
    x <- tmp1
    x <- x[order(x$id), ]
    row.names(x) <- NULL

    # convert lat/long to x, y, z
    x <- .latLongToXYZ(x)

    # plot and store globe
    f <- with(x, (stratumId - min(stratumId)) / (max(stratumId) - min(stratumId)))
    quads3d(x = x$x, y = x$y, z = x$z, col = rgb(0.1 + 0.3 * f, 0.1 + 0.3 * f, 0.2 + 0.8 * f), lit = FALSE)
}

## ---- rgl=TRUE, echo=FALSE, results='hide', fig.width=7, fig.height=4----
open3d(userMatrix = rbind(
    c( 0.73, -0.63, 0.25, 0),
    c( 0.37,  0.69, 0.63, 0),
    c(-0.57, -0.36, 0.74, 0),
    c( 0.00,  0.00, 0.00, 1)
))
mfrow3d(nr = 1, nc = 2, sharedMouse = TRUE)
plot3dXYZ(x = strata)
par3d(zoom = 0.7)
next3d()
plot3dXYZ(x = strata_crs)
par3d(zoom = 0.7)

## ------------------------------------------------------------------------
shp_mijdrecht <- readOGR(
    dsn = system.file("maps", package = "spcosa"), 
    layer = "mijdrecht", verbose = FALSE)
stratification <- stratify(shp_mijdrecht, nStrata = 1, nGridCells = 5000)
sampling_pattern <- spsample(stratification, n = 30)

## ---- fig.width=5, fig.height=7, out.width=300---------------------------
plot(stratification, sampling_pattern)

## ------------------------------------------------------------------------
doughnut <- expand.grid(s1 = -25:25, s2 = -25:25)
d <- with(doughnut, sqrt(s1^2 + s2^2))
doughnut <- doughnut[(d < 25) & (d > 15), ]
coordinates(doughnut) <- ~ s1 * s2
gridded(doughnut) <- TRUE

## ---- fig.width=5, fig.height=5, out.width=350---------------------------
stratification <- stratify(doughnut, nStrata = 2, nTry = 100)
sampling_pattern <- spsample(stratification)
plot(stratification, sampling_pattern)

## ---- echo=FALSE---------------------------------------------------------
sessionInfo()

