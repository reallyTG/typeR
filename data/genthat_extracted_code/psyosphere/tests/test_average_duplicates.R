
# Print title
cat("\nTesting average_duplicates()\n")

data(psyo)

# Check for simple geomean of two coordinates ----------------------------------

# Get data
simple2 <- psyo[c(1,15),]
simple2[2, c("time","id")] <- simple2[1, c("time","id")]

# test function
simple2 <- psyosphere::average_duplicates(simple2)

# Check results
if (NCOL(simple2) != 5) { stop("Not enough columns") }
if (NROW(simple2) != 1) { stop("Not rows") }
e <- val_psyo(simple2); if (e != "") {stop(e)}
if (round(simple2[,c("lon")],5) != round(4.969625,5)) {
  stop("Longitude is not correct")
}
if (round(simple2[,c("lat")],5) != round(52.33016,5)) {
  stop("Latitude is not correct")
}




