library(iDOS)


### Name: estimate.expression.cna.correlation
### Title: estimate.expression.cna.correlation
### Aliases: estimate.expression.cna.correlation
### Keywords: correlation

### ** Examples


# load test data
x <- get.test.data(data.types = c("mRNA.T", "CNA"));

# temporary output directory
tmp.output.dir <- tempdir();

# estimate mRNA and CNA correlation
correlated.features <- estimate.expression.cna.correlation(
  exp.data = x$mRNA.T$BLCA, 
  cna.data.log2 = x$CNA.log2$BLCA, 
  corr.threshold = 0.3, 
  corr.direction = "two.sided", 
  subtypes.metadata = list(
    "subtype.samples.list" = list("All" = colnames(x$mRNA.T$BLCA))
    ), 
  feature.ids = rownames(x$mRNA.T$BLCA), 
  cancer.type = "BLCA", 
  data.dir = paste(tmp.output.dir, "/data/BLCA/", sep = ""),
  graphs.dir = paste(tmp.output.dir, "/graphs/BLCA/", sep = "")
  );




