## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  library(redlistr)
#  library(stringr)

## ------------------------------------------------------------------------
#  # Example directory
#  input_dir <- # Path to folder with tif files
#  out_dir <- "C:/Users/Username/Desktop"
#  # List all files within input_dir that ends with .tif
#  input_list <- list.files(input_dir, pattern = '.tif$')
#  # Option to save shapefiles or not
#  saveSHP <- T

## ------------------------------------------------------------------------
#  # set up data capture
#  results_df <- data.frame (
#    # Name of the raster
#    in.raster = NA,
#    # Estimated area of ecosystem
#    eco.area.km2 = NA,
#    # Spatial resolution of data
#    eco.grain = NA,
#    # EOO of ecosystem
#    eoo.area.km2 = NA,
#    # AOO of ecosystem
#    aoo.no = NA,
#    # AOO of ecosystem with at least 1% in each grid cell
#    aoo.1pc = NA,
#    # Time taken for the analysis to complete
#    time.taken = NA)

## ------------------------------------------------------------------------
#  for (i in seq_along(input_list)){
#    # Prints out a message showing progress
#    message (paste("working on number... ", i, " of ", length(input_list)))
#    start_time <- proc.time()
#    filename  <- input_list[i]
#    input_string <- paste(input_dir, "\\", input_list[i], sep="")
#    rast = raster(input_string)
#    NAvalue(rast) <- 0
#    eco.area.km2 <- getArea(rast)
#    message (paste("... area of ecosystem is", eco.area.km2, "km^2"))
#    eco.grain <- paste(res(rast)[1], 'x', res(rast)[2])
#    eoo.shp <- makeEOO(rast)
#    eoo.area.km2 <- getAreaEOO(eoo.shp)
#    message (paste("... area of EOO is", eoo.area.km2, "km^2"))
#    aoo.no <- getAOO(rast,  10000, FALSE)
#    message (paste("... number of occupied grid cells is", aoo.no, "10 x 10-km cells"))
#    aoo.1pc <- getAOO(rast,  10000, TRUE)
#    message (paste("... number of AOO 1% grid cells is", aoo.1pc, "10 x 10-km cells"))
#    time_taken <- proc.time() - start_time
#    message (paste("file", i, "completed in ", time_taken))
#  
#    # Saving the results into the data frame
#    results_df$in.raster[i] <- filename
#    results_df$eco.area.km2[i] = eco.area.km2
#    results_df$eco.grain[i] = eco.grain
#    results_df$eoo.area.km2[i] = eoo.area.km2
#    results_df$aoo.no[i] = aoo.no
#    results_df$aoo.1pc[i] = aoo.1pc
#    results_df$time.taken[i] = time_taken
#  
#    # Saving shapefiles
#    if(saveShps == TRUE){
#      shapefile(eoo.shp, paste0(out_dir, filename, "eoo"), overwrite=TRUE)
#      aoo.shp <- makeAOOGrid (rast, 10000, one.percent.rule = FALSE)
#      shapefile(aoo.shp, paste0(out_dir, filename, "aoo"), overwrite=TRUE)
#      aoo1.shp <- makeAOOGrid (rast, 10000, one.percent.rule = TRUE)
#      shapefile(aoo1.shp, paste0(out_dir, filename, "aoo1"), overwrite=TRUE)
#    }
#  }
#  
#  # Printing a message when everything is completed
#  message ("Analysis complete.")
#  
#  # Saving the outputs as a csv file
#  write.csv(results_df, paste(out_dir, "redlistr_analysis.csv"))

## ------------------------------------------------------------------------
#  library(redlistr)
#  library(stringr)

## ------------------------------------------------------------------------
#  # Example directory
#  input_rast <- # raster(...)
#  out_dir <- "C:/Users/Username/Desktop"
#  # Option to save shapefiles or not
#  saveSHP <- T

## ------------------------------------------------------------------------
#  # set up data capture
#  results_df <- data.frame (
#    # Name of the raster
#    raster.class = NA,
#    # Estimated area of ecosystem
#    eco.area.km2 = NA,
#    # Spatial resolution of data
#    eco.grain = NA,
#    # EOO of ecosystem
#    eoo.area.km2 = NA,
#    # AOO of ecosystem
#    aoo.no = NA,
#    # AOO of ecosystem with at least 1% in each grid cell
#    aoo.1pc = NA,
#    # Time taken for the analysis to complete
#    time.taken = NA)

## ------------------------------------------------------------------------
#  val_table <- freq(input_rast, useNA = "no") # get class values from raster
#  vals <- val_table[,1] # convert table of values to vector
#  message('Raster has >>> ', length(vals) , ' <<< classes' )
#  
#  for (val in vals){
#    # Prints out a message showing progress
#    message (paste("working on class", val))
#    start_time <- proc.time()
#    # Create temporary raster where values are the current class
#    rast <- input_rast == i
#    values(rast)[values(rast) == 0] <- NA
#    NAvalue(rast) <- 0
#    eco.area.km2 <- getArea(rast)
#    message (paste("... area of ecosystem is", eco.area.km2, "km^2"))
#    eco.grain <- paste(res(rast)[1], 'x', res(rast)[2])
#    eoo.shp <- makeEOO(rast)
#    eoo.area.km2 <- getAreaEOO(eoo.shp)
#    message (paste("... area of EOO is", eoo.area.km2, "km^2"))
#    aoo.no <- getAOO(rast,  10000, FALSE)
#    message (paste("... number of occupied grid cells is", aoo.no, "10 x 10-km cells"))
#    aoo.1pc <- getAOO(rast,  10000, TRUE)
#    message (paste("... number of AOO 1% grid cells is", aoo.1pc, "10 x 10-km cells"))
#    time_taken <- proc.time() - start_time
#    message (paste("file", i, "completed in ", time_taken))
#  
#    # Saving the results into the data frame
#      temp_df <- data.frame(
#        eco.class = val,
#        eco.area.km2 = eco.area.km2,
#        eco.grain = eco.grain,
#        eoo.area.km2 = eoo.area.km2,
#        aoo.no = aoo.no,
#        aoo.1pc = aoo.1pc,
#        time_taken = time_taken)
#      results_df <- rbind(results_df, temp_df)
#    # Saving shapefiles
#    if(saveSHP == TRUE){
#      shapefile(eoo.shp, paste0(out_dir, filename, "eoo"), overwrite=TRUE)
#      aoo.shp <- makeAOOGrid (rast, 10000, one.percent.rule = FALSE)
#      shapefile(aoo.shp, paste0(out_dir, filename, "aoo"), overwrite=TRUE)
#      aoo1.shp <- makeAOOGrid (rast, 10000, one.percent.rule = TRUE)
#      shapefile(aoo1.shp, paste0(out_dir, filename, "aoo1"), overwrite=TRUE)
#    }
#  }
#  
#  # Printing a message when everything is completed
#  message ("Analysis complete.")
#  
#  # Saving the outputs as a csv file
#  write.csv(results_df, paste(out_dir, "redlistr_analysis.csv"))

