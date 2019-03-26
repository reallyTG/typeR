
# Prepare test
rm(list = ls(all.names = TRUE))
cat("\nTesting distance_psyo()\n")

# Test distance between the same psyo dataframe --------------------------------

# Get small sample of two times the same psyo dataframe
data(psyo_rounds2)
self_rounds_a <- psyo_rounds2
self_rounds_a <- self_rounds_a[1:3,]

# Get the distance between the two dataframes
self_rounds_a <- distance_psyo(self_rounds_a, self_rounds_a)

# Check results
e <- val_psyo(self_rounds_a); if (e != "") {stop(e)}
if (NCOL(self_rounds_a) != 11) { stop("Not enough columns") }
if (NROW(self_rounds_a) != 3) { stop("Not rows") }
sum_rounds <- sum(is.na(self_rounds_a$dis_to_17.gpx_1_in_m))
if (sum_rounds != 3) {
  stop("Sum is not 0")
}

# Test distance between different psyo dataframe -------------------------------

# Get small samples
data(psyo_rounds2)
psyo_distance <- select_test_sample(psyo_rounds2, 10)

# Get the distance between the two dataframes
psyo_distance <- distance_psyo(psyo_distance, psyo_distance)

# Check results
e <- val_psyo(psyo_distance); if (e != "") {stop(e)}
if (NCOL(psyo_distance) != 19) { stop("Not enough columns") }
if (NROW(psyo_distance) != 90) { stop("Not rows") }

dis_sum <- sum(psyo_distance$dis_to_17.gpx_1_in_m, na.rm = TRUE) +
  sum(psyo_distance$dis_to_48.gpx_1_in_m, na.rm = TRUE) +
  sum(psyo_distance$dis_to_52.gpx_1_in_m, na.rm = TRUE) +
  sum(psyo_distance$dis_to_17.gpx_2_in_m, na.rm = TRUE) +
  sum(psyo_distance$dis_to_48.gpx_2_in_m, na.rm = TRUE) +
  sum(psyo_distance$dis_to_52.gpx_2_in_m, na.rm = TRUE) +
  sum(psyo_distance$dis_to_17.gpx_3_in_m, na.rm = TRUE) +
  sum(psyo_distance$dis_to_48.gpx_4_in_m, na.rm = TRUE) +
  sum(psyo_distance$dis_to_52.gpx_4_in_m, na.rm = TRUE)

if (round(dis_sum, 5) != round(629.21434422715, 5)) {
  stop("Sum is not expected value")
}
