library(iDOS)


### Name: find.DE.features
### Title: find.DE.features
### Aliases: find.DE.features
### Keywords: differential features

### ** Examples


# load test data
x <- get.test.data(data.types = c("mRNA.T", "mRNA.N"));

# list of features to be assessed for differential expression
feature.ids <- rownames(x$mRNA.T$BLCA);

DE.results <- find.DE.features(
  exp.data.T = x$mRNA.T, 
  exp.data.N = x$mRNA.N, 
  feature.ids = feature.ids,
  test.name = "t.test"
  );




