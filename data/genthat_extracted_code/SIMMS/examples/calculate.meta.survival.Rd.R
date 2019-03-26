library(SIMMS)


### Name: calculate.meta.survival
### Title: Fit a meta-analytic Cox proportional hazards model to a single
###   feature
### Aliases: calculate.meta.survival
### Keywords: survival

### ** Examples

data.directory <- get.program.defaults()[["test.data.dir"]];
data.types <- c("mRNA");
x1 <- load.cancer.datasets(
  datasets.to.load = c('Breastdata1'),
  data.types = data.types,
  data.directory = data.directory
  );
x2 <- calculate.meta.survival(
  feature.name = "1000_at",
  expression.data = x1$all.data[[data.types[1]]],
  survival.data = x1$all.survobj
  );



