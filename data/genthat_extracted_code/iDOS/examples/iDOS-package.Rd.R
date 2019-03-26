library(iDOS)


### Name: iDOS-package
### Title: Integrated Discovery of Oncogenic Signatures
### Aliases: iDOS-package iDOS
### Keywords: package

### ** Examples


# load test data
x <- get.test.data(data.types = c("mRNA.T", "mRNA.N", "CNA", "ann"));

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

# temporary output directory
tmp.output.dir <- tempdir();

# estimate mRNA and CNA correlation using the pre-selected top features
correlated.features <- estimate.expression.cna.correlation(
  exp.data = x$mRNA.T$BLCA, 
  cna.data.log2 = x$CNA.log2$BLCA, 
  corr.threshold = 0.3, 
  corr.direction = "two.sided", 
  subtypes.metadata = list(
    "subtype.samples.list" = list("All" = colnames(x$mRNA.T$BLCA))
    ), 
  feature.ids = top.features, 
  cancer.type = "BLCA", 
  data.dir = paste(tmp.output.dir, "/data/BLCA/", sep = ""),
  graphs.dir = paste(tmp.output.dir, "/graphs/BLCA/", sep = "")
  );



