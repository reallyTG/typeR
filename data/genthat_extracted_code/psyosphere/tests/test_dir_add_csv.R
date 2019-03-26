
# Prepare test
cat("\nTesting dir_add_csv()\n")
rm(list = ls())
data(psyo)
csv_dir <- system.file("extdata", "ids.csv", package = "psyosphere")

# Check with default stringsAsFactors ------------------------------------------

# Calculations

psyo_csv <- dir_add_csv(psyo, csv_dir)

# Check results
if (NCOL(psyo_csv) != 8) { stop("Not enough columns") }
if (NROW(psyo_csv) != 15) { stop("Not rows") }
e <- val_psyo(psyo_csv); if (e != "") {stop(e)}
rm(psyo_csv, e)

# Check with default stringsAsFactors FALSE ------------------------------------

# Calculations
psyo_csv <- dir_add_csv(psyo, csv_dir, stringsAsFactors = FALSE)

# Check results
if (class(psyo_csv[,"team"]) != "character") { stop("Wrong class") }
