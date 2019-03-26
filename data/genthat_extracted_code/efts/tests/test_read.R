context("Write-Read Round trip EFTS netCDF data set")

tempNcFname <- tempfile()
variable_names <- c("variable_1", "variable_2")
stations_ids <- c(123, 456)

nEns <- 3
nLead <- 4
x <- 1:(nEns * nLead)
x <- matrix(as.numeric(x), nrow = nLead)
y <- x + nEns * nLead

timeAxisStart <- ISOdate(year = 2010, month = 8, day = 1, hour = 12, min = 0, 
  sec = 0, tz = "UTC")
start_time <- timeAxisStart + lubridate::hours(6L)
v1 <- variable_names[1]
s1 <- stations_ids[1]
v2 <- variable_names[2]
s2 <- stations_ids[2]
time_dim_info <- create_time_info(from = timeAxisStart, n = 10)


# put tests in a tryCatch, to maximise the chances of cleaning up temporary
# files.
doTests <- function() {
  test_that("Can create a small EFTS netCDF file", {
    
    varsDef <- data.frame(name = variable_names, stringsAsFactors = FALSE)
    varsDef$longname <- paste("long name for", varsDef$name)
    varsDef$units <- "mm"
    varsDef$missval <- -999
    varsDef$precision <- "double"
    varsDef$type <- 2
    varsDef$dimensions <- "4"
    varsDef$type_description <- "accumulated over the previous time step"
    varsDef$location_type <- "Point"
    
    glob_attr <- create_global_attributes(title="title test", institution="test", source="test", catchment="dummy", comment="none")

    snc <- create_efts(tempNcFname, time_dim_info, create_variable_definitions(varsDef), 
      stations_ids, nc_attributes=glob_attr, lead_length = nLead, ensemble_length = nEns)
    
    
    snc$put_ensemble_forecasts(x, variable_name = v1, identifier = s1, start_time = start_time)
    snc$put_ensemble_forecasts(y, variable_name = v2, identifier = s2, start_time = start_time)
    
    r1 <- snc$get_ensemble_forecasts(variable_name = v1, identifier = s1, start_time = start_time)
    r2 <- snc$get_ensemble_forecasts(variable_name = v2, identifier = s2, start_time = start_time)
    expect_equal(as.numeric(r1[2, 2]), 6)
    expect_equal(as.numeric(r2[2, 2]), 18)
    snc$close()
  })
  
  test_that("Can read back a small EFTS netCDF file", {
    snc <- open_efts(tempNcFname)
    r1 <- snc$get_ensemble_forecasts(variable_name = v1, identifier = s1, start_time = start_time)
    r2 <- snc$get_ensemble_forecasts(variable_name = v2, identifier = s2, start_time = start_time)
    expect_equal(as.numeric(r1[2, 2]), 6)
    expect_equal(as.numeric(r2[2, 2]), 18)
    snc$close()
  })
}  # end doTests

tryCatch(doTests(), finally = function() {
  if (file.exists(tempNcFname)) 
    file.remove(tempNcFname)
}) 
