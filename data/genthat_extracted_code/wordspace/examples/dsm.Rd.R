library(wordspace)


### Name: dsm
### Title: Create DSM Object Representing a Distributional Semantic Model
###   (wordspace)
### Aliases: dsm dsm-object
### Keywords: classes

### ** Examples


MyDSM <- dsm(
  target =  c("boat", "boat", "cat",  "dog", "dog"),
  feature = c("buy",  "use",  "feed", "buy", "feed"),
  score =   c(1,      3,      2,      1,     1),
  raw.freq = TRUE
)

print(MyDSM)   # 3 x 3 matrix with 5 out of 9 nonzero cells
print(MyDSM$M) # the actual co-occurrence matrix

print(MyDSM$rows) # row information
print(MyDSM$cols) # column information




