## ---- include = FALSE----------------------------------------------------
is_check <- ("CheckExEnv" %in% search()) || any(c("_R_CHECK_TIMINGS_",
             "_R_CHECK_LICENSE_") %in% names(Sys.getenv()))
knitr::opts_chunk$set(eval = !is_check)

## ------------------------------------------------------------------------
Sys.sleep(100)

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
    comment = NA,
    quiet = TRUE,
    progress = FALSE,
    tidy = FALSE,
    cache = FALSE,
    message = FALSE,
    error = FALSE, # FALSE: always stop execution.
    warning = TRUE,
    dpi = 100
)

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_knit$set(global.par = TRUE)

## ---- echo = FALSE-------------------------------------------------------
par(mar = c(3, 3, 2, 2), mgp = c(1.7, 0.5, 0), las = 1, cex.main = 1, tcl = -0.2, cex.axis = 0.8,
    cex.lab = 0.8)

## ---- fig.width = 5, fig.height = 5--------------------------------------
# load packages
library(sp)
library(spup)
library(purrr)
library(png)

set.seed(12345)

# load data
data(woon)
# Netherlands contour and Rtterdam location
NL <- readPNG("RotterdamNL.png")
# collate info about fugure size and type 										
NL_map <- list("grid.raster", NL, x = 89987, y = 436047, width = 120,   
				height = 152, default.units = 'native')
# collate info about a scale bar location in the figure, type and colour
scale <- list("SpatialPolygonsRescale", layout.scale.bar(), 			
			  offset = c(90000,435600), scale = 100, fill=c("transparent","black"))
# collate info about minimum value on a scale bar
text1 <- list("sp.text", c(89990,435600), "0", cex = 0.8)
# collate info about maximum value on a scale bar
text2 <- list("sp.text", c(90130,435600), "500 m", cex = 0.8)
# collate info about North arrow
arrow <- list("SpatialPolygonsRescale", layout.north.arrow(),
              offset = c(89990,435630), scale = 50)
# plot 'woon' object with a location miniature, North arrow and scale bar defined above      
spplot(woon, "check", do.log = TRUE, col.regions = "transparent",
	   colorkey = FALSE, key.space = list(x = 0.1, y = 0.93, corner = c(0,1)),
sp.layout = list(scale, text1, text2 ,arrow, NL_map),	
                 main = "Neighbourhood in Rotterdam, NL")

## ------------------------------------------------------------------------
# define uncertainty model for the bulding function
woonUM <- defineUM(TRUE, categories = c(1,2,3), cat_prob = woon[, c(4:6)])
class(woonUM)

## ------------------------------------------------------------------------
woon$check <- woon$residential + woon$office + woon$other
summary(woon$check)

## ------------------------------------------------------------------------
spplot(woon[c(4,5,6)])

## ---- fig.width = 7, fig.height = 7--------------------------------------
# create possible realizations of the building function
woon_sample <- genSample(woonUM, 10, asList = FALSE)
class(woon_sample)

# view several realizations
spplot(woon_sample[c(3,4,1,2)], main = list(label = "Examples of building function realizations", cex = 1))

## ------------------------------------------------------------------------
tax <- function(building_Function) { 
  building_Function$tax2pay <- NA
  building_Function$tax2pay[building_Function$Function == 1] <- 1000
  building_Function$tax2pay[building_Function$Function == 2] <- 10000
  building_Function$tax2pay[building_Function$Function == 3] <- 10
  total_tax <- sum(building_Function$tax2pay)
  total_tax
}

## ------------------------------------------------------------------------
# coerce  SpatialPolygonDataFrame to a list of individual SpatialPolygonDataFrames
woon_sample <- map(1:ncol(woon_sample), function(x){woon_sample[x]})

# or sample from uncertain input and save it in a list
woon_sample <- genSample(UMobject = woonUM, n = 10, asList = TRUE)
class(woon_sample)

## ------------------------------------------------------------------------
for (i in 1:10) names(woon_sample[[i]]) <- "Function"

## ------------------------------------------------------------------------
# run uncertainty propagation
tax_sample <- propagate(woon_sample, model = tax, n = 10)
tax_sample
summary(unlist(tax_sample))

