
# Print title
cat("\nTesting distance_psyo()\n")

# Test simple distance between two coordinates within a track ------------------
data(psyo)
psyo2 <- psyo[1:2,]
psyo2 <- psyosphere::t_speed(psyo2)

# Check results
if (NCOL(psyo2) != 6) { stop("Not enough columns") }
if (NROW(psyo2) != 2) { stop("Not rows") }
e <- val_psyo(psyo2); if (e != "") {stop(e)}
if (round(psyo2[2,c("speed")],5) != round(24.33812,5)) {
  stop("Speed is not correct")
}

# Test same timestamp ----------------------------------------------------------
data(psyo)
psyo8 <- psyo[1:2,]
psyo8[,c("time")] <- psyo8[1,c("time")]
psyo8 <- psyosphere::t_speed(psyo8)

# Check results
if (NCOL(psyo8) != 6) { stop("Not enough columns") }
if (NROW(psyo8) != 2) { stop("Not rows") }
e <- val_psyo(psyo8); if (e != "") {stop(e)}

if (!all(is.na(psyo8$speed))) { stop("Alle values should be NA") }

# Test simple distance between 3 tracks ----------------------------------------
data(psyo)
psyo3 <- psyo
psyo3 <- psyosphere::t_speed(psyo3)

# Check results
if (NCOL(psyo3) != 6) { stop("Not enough columns") }
if (NROW(psyo3) != 15) { stop("Not rows") }
e <- val_psyo(psyo3); if (e != "") {stop(e)}

psyo3_sum <- sum(psyo3[,c("speed")],na.rm = TRUE)
if (round(psyo3_sum,10) != round(156.191537845271,10)) {
  stop("Speed is not correct")
}



