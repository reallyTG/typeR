
cat("\nTesting mark_gap_segments()\n")

# Simple test of gap segments --------------------------------------------------

# Get data
data(psyo_rounds2)

# Correct data
t_seg <- psyosphere::average_duplicates(psyo_rounds2)
t_seg <- t_time_difference(t_seg)
t_seg <- mark_time_gaps(t_seg)

# Add gap segments
t_seg <- mark_gap_segments(t_seg, "time_gap")

# Check result
test_sum <- sum(t_seg$gap_segments, na.rm = TRUE)
if (NROW(t_seg) != 634) { stop("Wrong number of observations") }
if (NCOL(t_seg) != 13) { stop("Wrong number of variables") }
if (test_sum != 1089598) { stop("Test segment sum is wrong") }

# Test when first and last point are a gap -------------------------------------

# Get data
data(psyo_rounds2)

# Correct data
t_seg2 <- psyo_rounds2[1:10,]
t_seg2 <- psyosphere::average_duplicates(t_seg2)
t_seg2 <- t_time_difference(t_seg2)
t_seg2 <- mark_time_gaps(t_seg2)

# Add fake gaps
t_seg2[c(1,10),"time_gap"] <- TRUE

# Add gap segments
t_seg2 <- mark_gap_segments(t_seg2, "time_gap")

# Check results
if (NROW(t_seg2) != 10) { stop("Wrong number of observations") }
if (NCOL(t_seg2) != 13) { stop("Wrong number of variables") }
test_sum <- sum(t_seg2$gap_segments)
if (round(test_sum,3) != round(5407,3)) {stop("Wrong test_sum")}
