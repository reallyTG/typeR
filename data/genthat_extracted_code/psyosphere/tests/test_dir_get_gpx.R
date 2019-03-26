
# Prepare test
cat("\nTesting dir_get_gpx()\n")
rm(list = ls(all.names = TRUE))

gpx_dir <- system.file("extdata", package="psyosphere")

# Check with default string as factors -----------------------------------------

# Calculations
psyo_rounds <- dir_get_gpx(gpx_dir, tz="MET")

# Check results
if(NROW(psyo_rounds)!=9148) { stop("Wrong number of observations") }
if(NCOL(psyo_rounds)!=6) { stop("Wrong number of variables") }
psyosphere::val_psyo(psyo_rounds)
test_sum <- sum(psyo_rounds[,"lon"])
if(round(test_sum,3)!=round(62670.9175,3)) {stop("Wrong test_sum")}
rm(psyo_rounds)

# Check with strings as factors FALSE ------------------------------------------

# Calculations
psyo_rounds <- dir_get_gpx(gpx_dir, tz="MET", stringsAsFactors = FALSE)

# Check results
if (class(psyo_rounds[,"id"]) != "character") {stop("Wrong class")}
