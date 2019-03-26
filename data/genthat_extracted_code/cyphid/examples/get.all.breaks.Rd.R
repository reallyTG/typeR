library(cyphid)


### Name: get.all.breaks
### Title: Identify all breakpoints.
### Aliases: get.all.breaks

### ** Examples

# Run primary function for dividing sequences into cycles and cycles into phases
JawBreaks40 <- get.all.breaks(jaw, window=40)

# Check window based on cycle durations.
cycledurs <- get.cycle.durations(JawBreaks40$cyclemat)
win <- get.window(cycledurs)
win

# Rerun with modified window
JawBreaks27 <- get.all.breaks(jaw, window=27)

# Plot the output
plot(jaw[,1])
abline(v=JawBreaks27$openbreaks[,1])



