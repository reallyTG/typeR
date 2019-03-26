library(psyosphere)


### Name: mark_gap_segments
### Title: Adding column with segment names between gaps
### Aliases: mark_gap_segments

### ** Examples

data(psyo_rounds2)
psyo_rounds2 <- average_duplicates(psyo_rounds2)
psyo_rounds2 <- t_time_difference(psyo_rounds2)

psyo_rounds2 <- mark_time_gaps(psyo_rounds2)
psyo_rounds2 <- mark_gap_segments(psyo_rounds2,"time_gap")



