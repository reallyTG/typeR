library(epitrix)


### Name: clean_labels
### Title: Standardise labels
### Aliases: clean_labels

### ** Examples


clean_labels("-_-This is; A    WeÏrD**./sêntënce...")
clean_labels("-_-This is; A    WeÏrD**./sêntënce...", sep = ".")
input <- c("Peter and stëven", "peter-and.stëven", "pëtêr and stëven  _-")
input
clean_labels(input)




