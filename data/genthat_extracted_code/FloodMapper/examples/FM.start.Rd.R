library(FloodMapper)


### Name: FM.start
### Title: Start A Model Run
### Aliases: FM.start

### ** Examples

## Load FloodMapper package
library(FloodMapper)

## Step 1. Initialize a new model run with a name of "Lafayette_1km"
s_runfolder <- file.path(tempdir(), "Lafayette_1km")
if (dir.exists(s_runfolder)) {
    ## delete this folder if it already exists
    unlink(s_runfolder, recursive = TRUE, force = TRUE)
}
s_return_sp1 <- FM.init(runname = "Lafayette_1km", 
    startdatetime = "2016-08-12 10:00:00", 
    enddatetime = "2016-08-12 11:00:00", 
    outputinterval = 3600, internaltimestep = 300,
    wdbreakpoints = seq(0, 3000, 150), workdir = tempdir())

## Check if there are any errors
if (s_return_sp1 != "") {
    cat("Model initiation is failed because of the following error:\n")
    cat(s_return_sp1)
} else {
    cat("Model initiation is successful!\n")
}

## Step 2. Load the 1000km DEM raster for Lafayette Parish, LA, USA from the sample dataset
s_return_sp2 <- NA
if (s_return_sp1 == "") {
    s_return_sp2 <- FM.readDEM(system.file("extdata", "LF_DEM_1000m.tif",
                               package = "FloodMapper", mustWork = TRUE))

    ## Check if there are any errors
    if (s_return_sp2 != "") {
        cat("Loading DEM is failed because of the following error:\n")
        cat(s_return_sp2)
    } else {
        cat("Loading DEM is successful!\n")
    }
}

## Step 3. Load the 1000km land cover raster from the sample dataset
s_return_sp3 <- NA
if (!is.na(s_return_sp2)) {
    if (s_return_sp2 == "") {
        s_return_sp3 <- FM.readLandcover(system.file("extdata", 
             "LF_land_1000m.tif", package = "FloodMapper", mustWork = TRUE))

        ## Check if there are any errors
        if (s_return_sp3 != "") {
            cat("Loading land cover is failed because of the following error:\n")
            cat(s_return_sp3)
        } else {
            cat("Loading land cover is successful!\n")
        }
    }
}

## Step 4. Load the 1000km rasters for soil texture and 
##         soil depth from the sample dataset, set the 
##         initial soil moisture content to 0.4785.
s_return_sp4 <- NA
if (!is.na(s_return_sp3)) {
    if (s_return_sp3 == "") {
        s_return_sp4 <- FM.readSoil(soilfile = system.file("extdata",
                  "LF_soil_1000m.tif", package = "FloodMapper", mustWork = TRUE),
                  soildepthfile = system.file("extdata", "LF_gwl_1000m.tif", 
                             package = "FloodMapper", mustWork = TRUE),
                  soilmoistcontent = 0.4785)

        ## Check if there are any errors
        if (s_return_sp4 != "") {
            cat("Loading soil rasters is failed because of the following error:\n")
            cat(s_return_sp4)
        } else {
            cat("Loading soil rasters is successful!\n")
        }
    }
}

## Step 5. Load the 1000km raster for street drain inlet
s_return_sp5 <- NA
if (!is.na(s_return_sp4)) {
    if (s_return_sp4 == "") {
        ## Assume that the drain inlet raster is stored in LF_draininlet_1000m.tif
        s_return_sp5 <- FM.readDraininlets(draininletfile = system.file("extdata",
                           "LF_draininlet_1000m.tif", package = "FloodMapper", 
                           mustWork = TRUE))
	
        ## Check if there are any errors
        if (!is.na(s_return_sp5)) {
            if (s_return_sp5 != "") {
                cat("Loading street drain inlet is failed because of the following error:\n")
                cat(s_return_sp5)
            } else {
                cat("Loading street drain inlet is successful!\n")
            }
        }
    }
}

## Step 6. Load precipitation data from one weather station
s_return_sp6 <- NA
if (!is.na(s_return_sp5)) {
    if (s_return_sp5 == "") {
        s_return_sp6 <- FM.readPrecip(datatype = 0, 
            txtfile = system.file("extdata", "Pstations_1hr.txt", 
                           package = "FloodMapper", mustWork = TRUE),
            startdatetime = "2016-08-12 10:00:00",
            enddatetime = "2016-08-12 11:00:00",
            interval = 3600)
	
        ## Check if there are any errors
        if (s_return_sp6 != "") {
            cat("Loading precipitation data is failed because of the following error:\n")
            cat(s_return_sp6)
        } else {
            cat("Loading precipitation data is successful!\n")
        }
    }
}

## Step 7. Load inflow data from one weather station
s_return_sp7 <- NA
if (!is.na(s_return_sp6)) {
    if (s_return_sp6 == "") {
        ## Assume that the information of inflow monitoring stations is stored in INstations_1hr.txt
		s_return_sp7 <- FM.readInflow(datatype = 0, 
            txtfile = system.file("extdata", "INstations_1hr.txt", 
                           package = "FloodMapper", mustWork = TRUE),
            startdatetime = "2016-08-12 10:00:00",
            enddatetime = "2016-08-12 11:00:00", interval = 3600)
	
        ## Check if there are any errors
        if (!is.na(s_return_sp7)) {
            if (s_return_sp7 != "") {
                cat("Loading inflow data is failed because of the following error:\n")
                cat(s_return_sp7)
            } else {
                cat("Loading inflow data is successful!\n")
            }
        }
    }
}

## Step 8. Start a model run
s_return_sp8 <- NA
if (!is.na(s_return_sp7)) {
    if (s_return_sp7 == "") {
        s_return_sp8 <- FM.start(animation = TRUE, bgtype = 0, 
                             aerialraster = "", pdfoutput = FALSE)
	
        ## Check if there are any errors
        if (s_return_sp8 != "") {
            cat("Model run is failed because of the following error:\n")
            cat(s_return_sp8)
        } else {
            cat("Model run is successful!\n")
        }
    }
}




