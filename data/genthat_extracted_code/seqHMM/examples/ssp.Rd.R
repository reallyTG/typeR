library(seqHMM)


### Name: ssp
### Title: Define Arguments for Plotting Multichannel Sequences and/or Most
###   Probable Paths from Hidden Markov Models
### Aliases: ssp

### ** Examples

data("biofam3c")

## Building sequence objects
child_seq <- seqdef(biofam3c$children, start = 15)
marr_seq <- seqdef(biofam3c$married, start = 15)
left_seq <- seqdef(biofam3c$left, start = 15)

## Choosing colors
attr(child_seq, "cpal") <- c("#66C2A5", "#FC8D62")
attr(marr_seq, "cpal") <- c("#AB82FF", "#E6AB02", "#E7298A")
attr(left_seq, "cpal") <- c("#A6CEE3", "#E31A1C")


# Defining the plot for state distribution plots of observations
ssp1 <- ssp(list("Parenthood" = child_seq, "Marriage" = marr_seq,
                 "Residence" = left_seq))
# Plotting ssp1
plot(ssp1)

## Not run: 
##D # Defining the plot for sequence index plots of observations
##D ssp2 <- ssp(
##D   list(child_seq, marr_seq, left_seq), type = "I", plots = "obs",
##D   # Sorting subjects according to the beginning of the 2nd channel (marr_seq)
##D   sortv = "from.start", sort.channel = 2,
##D   # Controlling the size, positions, and names for channel labels
##D   ylab.pos = c(1, 2, 1), cex.lab = 1, ylab = c("Children", "Married", "Residence"),
##D   # Plotting without legend
##D   with.legend = FALSE)
##D plot(ssp2)
##D 
##D # Plotting hidden Markov models
##D 
##D # Loading data
##D data("hmm_biofam")
##D 
##D # Plotting observations and most probable hidden states paths
##D ssp3 <- ssp(
##D   hmm_biofam, type = "I", plots = "both",
##D   # Sorting according to multidimensional scaling of hidden states paths
##D   sortv = "mds.hidden",
##D   # Controlling title
##D   title = "Biofam", cex.title = 1.5,
##D   # Labels for x axis and tick marks
##D   xtlab = 15:30, xlab = "Age")
##D plot(ssp3)
##D 
##D # Computing the most probable paths of hidden states
##D hid <- hidden_paths(hmm_biofam)
##D # Giving names for hidden states
##D library(TraMineR)
##D alphabet(hid) <- paste("Hidden state", 1:5)
##D 
##D # Plotting observations and hidden state paths
##D ssp4 <- ssp(
##D   hmm_biofam, type = "I", plots = "hidden.paths",
##D   # Sequence object of most probable paths
##D   hidden.paths = hid,
##D   # Sorting according to the end of hidden state paths
##D   sortv = "from.end", sort.channel = 0,
##D   # Contolling legend position, type, and proportion
##D   with.legend = "bottom.combined", legend.prop = 0.15,
##D   # Plotting without title and y label
##D   title = FALSE, ylab = FALSE)
##D plot(ssp4)
## End(Not run)



