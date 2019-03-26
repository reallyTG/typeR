library(SIMMS)


### Name: load.cancer.datasets
### Title: Load all cancer meta-analysis datasets
### Aliases: load.cancer.datasets
### Keywords: IO

### ** Examples

data.dir <- get.program.defaults()[["test.data.dir"]];
x1 <- load.cancer.datasets(
  datasets.to.load = c('Breastdata1'),
  data.types = c("mRNA"),
  data.directory = data.dir
  );



