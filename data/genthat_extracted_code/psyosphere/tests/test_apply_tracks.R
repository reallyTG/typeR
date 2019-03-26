
# Print title
cat("\nTesting apply_tracks()\n")

# Test function 1 of ebu_save_data_private() -----------------------------------

result <- c(NA, 1, 2, 5,6, NA)
iteration_result <- c(1,2,3,4)

test_ebu <- psyosphere:::ebu_save_data_private(result, iteration_result)

# Check results
if (NROW(test_ebu) != 10) { stop("Wrong number of observations") }
test_sum <- sum(test_ebu, na.rm = T)
if (round(test_sum,3) != round(24,3)) {stop("Wrong test_sum")}

# Test function 2 of ebu_save_data_private() -----------------------------------

result2 <- data.frame(test = c(NA, 1, 2, 5,6, NA))
iteration_result2 <- data.frame(test = c(1,2,3,4))

test_ebu2 <- psyosphere:::ebu_save_data_private(result2, iteration_result2)

# Check results
if (NROW(test_ebu2) != 10) { stop("Wrong number of observations") }
test_sum2 <- sum(test_ebu2, na.rm = T)
if (round(test_sum2,3) != round(24,3)) {stop("Wrong test_sum")}
