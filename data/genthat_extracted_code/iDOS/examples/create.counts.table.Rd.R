library(iDOS)


### Name: create.counts.table
### Title: create.counts.table
### Aliases: create.counts.table
### Keywords: output

### ** Examples


# load test data
x <- get.test.data(data.types = c("mRNA.T", "CNA"));

# temporary output directory
tmp.output.dir <- tempdir();

# go through each cancer type iteratively and perform mRNA-CNA correlation analysis
correlated.features <- list();
for (cancer.type in names(x$mRNA.T)) {

  # estimate mRNA and CNA correlation for each cancer/disease type
  correlated.features[[cancer.type]] <- estimate.expression.cna.correlation(
    exp.data = x$mRNA.T[[cancer.type]], 
    cna.data.log2 = x$CNA.log2[[cancer.type]], 
    corr.threshold = 0.3, 
    corr.direction = "two.sided", 
    subtypes.metadata = list(
      "subtype.samples.list" = list("All" = colnames(x$mRNA.T[[cancer.type]]))
	  ), 
    feature.ids = rownames(x$mRNA.T[[cancer.type]]), 
    cancer.type = cancer.type, 
    data.dir = paste(tmp.output.dir, "/data/", cancer.type, sep = ""),
    graphs.dir = paste(tmp.output.dir, "/graphs/", cancer.type, sep = "")
    );
  }

# create counts table across cancer types
counts.table <- create.counts.table(corr.summary = correlated.features);




