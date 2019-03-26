library(cba)


### Name: plot.sdists.graph
### Title: Plotting Edit Transcripts and Sequence Alignments
### Aliases: plot.sdists.graph
### Keywords: cluster

### ** Examples

## continue example in sdists.trace
x1 <- "vintner"
y1 <- "writers"
b11 <- sdists.trace(x1, y1, weight=c(1,1,0,1), graph = TRUE)
b11
plot(b11)
plot(b11, circle.scale = "text")
## partial
b12 <- sdists.trace(x1, y1, weight=c(1,1,0,1), graph = TRUE, partial = TRUE)
b12
plot(b12)



