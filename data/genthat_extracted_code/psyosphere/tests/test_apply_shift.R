
# Print title
cat("\nTesting apply_shift()\n")

# Shift positive column --------------------------------------------------------
data(psyo)
shift_fol <- psyosphere::apply_shift(psyo, factor = "+1", csubset = c("lon"))

# Check results
if (NCOL(shift_fol) != 6) { stop("Not enough columns") }
if (NROW(shift_fol) != 15) { stop("Not rows") }
e <- val_psyo(shift_fol); if (e != "") {stop(e)}

# Shift negative column --------------------------------------------------------
data(psyo)
shift_pre <- psyosphere::apply_shift(psyo, factor = "-1", csubset = c("lon"))

# Chreck results
if (NCOL(shift_pre) != 6) { stop("Not enough columns") }
if (NROW(shift_pre) != 15) { stop("Not rows") }
e <- val_psyo(shift_pre); if (e != "") {stop(e)}

# Shift two columns ------------------------------------------------------------
data(psyo)
shift2 <- psyosphere::apply_shift(psyo, csubset = c("lon", "lat"))

# Check results
if (NCOL(shift2) != 9) { stop("Not enough columns") }
if (NROW(shift2) != 15) { stop("Not rows") }
e <- val_psyo(shift2); if (e != "") {stop(e)}
shift2[,c("id","time")] <- list(NULL)
sum <- sum( colSums(shift2, na.rm = TRUE) , na.rm = TRUE)
if (round(sum,5) != round(2264.01541,5)) {
  stop("Unexpected value")
}
