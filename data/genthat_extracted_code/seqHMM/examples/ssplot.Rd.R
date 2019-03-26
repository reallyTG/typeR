library(seqHMM)


### Name: ssplot
### Title: Stacked Plots of Multichannel Sequences and/or Most Probable
###   Paths from Hidden Markov Models
### Aliases: ssplot

### ** Examples

data("biofam3c")

# Creating sequence objects
child_seq <- seqdef(biofam3c$children, start = 15)
marr_seq <- seqdef(biofam3c$married, start = 15)
left_seq <- seqdef(biofam3c$left, start = 15)

## Choosing colors
attr(child_seq, "cpal") <- c("#66C2A5", "#FC8D62")
attr(marr_seq, "cpal") <- c("#AB82FF", "#E6AB02", "#E7298A")
attr(left_seq, "cpal") <- c("#A6CEE3", "#E31A1C")


# Plotting state distribution plots of observations
ssplot(list("Children" = child_seq, "Marriage" = marr_seq,
"Residence" = left_seq))

## Not run: 
##D # Plotting sequence index plots of observations
##D ssplot(
##D   list(child_seq, marr_seq, left_seq), type = "I",
##D   # Sorting subjects according to the beginning of the 2nd channel (marr_seq)
##D   sortv = "from.start", sort.channel = 2,
##D   # Controlling the size, positions, and names for channel labels
##D   ylab.pos = c(1, 2, 1), cex.lab = 1, ylab = c("Children", "Married", "Residence"),
##D   # Plotting without legend
##D   with.legend = FALSE)
##D 
##D # Plotting hidden Markov models
##D 
##D # Loading a ready-made HMM for the biofam data
##D data("hmm_biofam")
##D 
##D # Plotting observations and hidden states paths
##D ssplot(
##D   hmm_biofam, type = "I", plots = "both",
##D   # Sorting according to multidimensional scaling of hidden states paths
##D   sortv = "mds.hidden",
##D   ylab = c("Children", "Married", "Left home"),
##D   # Controlling title
##D   title = "Biofam", cex.title = 1.5,
##D   # Labels for x axis and tick marks
##D   xtlab = 15:30, xlab = "Age")
##D 
##D # Computing the most probable paths of hidden states
##D hidden.paths <- hidden_paths(hmm_biofam)
##D hidden.paths_seq <- seqdef(hidden.paths, labels = paste("Hidden state", 1:5))
##D 
##D # Plotting observations and hidden state paths
##D ssplot(
##D   hmm_biofam, type = "I", plots = "hidden.paths",
##D   # Sequence object of most probable paths
##D   hidden.paths = hidden.paths_seq,
##D   # Sorting according to the end of hidden state paths
##D   sortv = "from.end", sort.channel = 0,
##D   # Contolling legend position, type, and proportion
##D   with.legend = "bottom", legend.prop = 0.15,
##D   # Plotting without title and y label
##D   title = FALSE, ylab = FALSE)
##D   
## End(Not run)



