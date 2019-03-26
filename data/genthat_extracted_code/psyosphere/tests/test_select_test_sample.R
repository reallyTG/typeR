
# Print title
cat("\nTesting plot_map()\n")

# Test calculations
data(psyo)
test_tracks <- psyosphere::select_test_sample(psyo)

# Check results
if (nrow(test_tracks) != 9) {
  stop("plot_map() test value is not as expected.")
}
