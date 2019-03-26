library(DepLogo)


### Name: colorchart
### Title: Plot a colorchart representation of a set of sequences.
### Aliases: colorchart

### ** Examples

# read data and create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[,1], weights = log1p(seqs[, 2]) )

# create high-level plot
plot(NULL, xlim = c(1, ncol(data$data) - 1), ylim = c(0, nrow(data$data)), 
    ylab = nrow(data$data), axes = FALSE)
# and add colorchart and axis
colorchart(data, yoff = nrow(data$data))
axis(1)



