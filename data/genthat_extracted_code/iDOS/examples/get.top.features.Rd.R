library(iDOS)


### Name: get.top.features
### Title: get.top.features
### Aliases: get.top.features
### Keywords: candidate drivers

### ** Examples


# load test data
x <- get.test.data(data.types = c("mRNA.T", "mRNA.N", "CNA"));

# list of features to be assessed for differential expression
feature.ids <- rownames(x$mRNA.T$BLCA);

# get differentially expressed features
DE.results <- find.DE.features(
  exp.data.T = x$mRNA.T, 
  exp.data.N = x$mRNA.N, 
  feature.ids = feature.ids,
  test.name = "t.test"
  );

# get top features
top.features <- get.top.features(
  DE.features = cbind("FC" = DE.results[, 1], "P" = DE.results[, 2]),
  cna.data.fractions = x$CNA.fractions$BLCA, 
  mRNA.FC.up = 0.25, 
  mRNA.FC.down = 0.25, 
  mRNA.p = 0.05, 
  mRNA.top.n = NULL, 
  cna.fractions.gain = 0.2, 
  cna.fractions.loss = 0.2
  );




