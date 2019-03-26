library(SIMMS)


### Name: dichotomize.meta.dataset
### Title: Dichotomize and unlist a meta-analysis list
### Aliases: dichotomize.meta.dataset
### Keywords: survival

### ** Examples

data.directory <- get.program.defaults()[["test.data.dir"]];
data.types <- c("mRNA");
x1 <- load.cancer.datasets(
  datasets.to.load = c('Breastdata1'),
  data.types = data.types,
  data.directory = data.directory
  );
x2 <- dichotomize.meta.dataset(
  feature.name = "1000_at",
  expression.data = x1$all.data[[data.types[1]]],
  survival.data = x1$all.survobj
  );



