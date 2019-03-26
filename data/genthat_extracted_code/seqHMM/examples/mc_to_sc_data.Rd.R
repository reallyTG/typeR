library(seqHMM)


### Name: mc_to_sc_data
### Title: Merge Multiple Sequence Objects into One (from Multichannel to
###   Single Channel Data)
### Aliases: mc_to_sc_data

### ** Examples

# Load three-channel sequence data
data("biofam3c")

# Building sequence objects
marr_seq <- seqdef(biofam3c$married, start = 15,
  alphabet = c("single", "married", "divorced"))
child_seq <- seqdef(biofam3c$children, start = 15,
  alphabet = c("childless", "children"))
left_seq <- seqdef(biofam3c$left, start = 15,
  alphabet = c("with parents", "left home"))

# Define colors
attr(marr_seq, "cpal") <- c("violetred2", "darkgoldenrod2", "darkmagenta")
attr(child_seq, "cpal") <- c("darkseagreen1", "coral3")
attr(left_seq, "cpal") <- c("lightblue", "red3")

# Converting multichannel data to single-channel data
sc_data <- mc_to_sc_data(list(marr_seq, child_seq, left_seq))

# 10 combined states
alphabet(sc_data)

# Colors for combined states
attr(sc_data, "cpal") <- colorpalette[[14]][1:10]

# Plotting sequences for the first 10 subjects
ssplot(list("Marriage" = marr_seq, "Parenthood" = child_seq, 
  "Residence" = left_seq, "Combined" = sc_data), type = "I",
  tlim = 1:10)


# Including all combinations (whether or not available in data)
sc_data_all <- mc_to_sc_data(list(marr_seq, child_seq, left_seq),
  all_combinations = TRUE)

# 12 combined states, 2 with no observations in data
seqstatf(sc_data_all)




