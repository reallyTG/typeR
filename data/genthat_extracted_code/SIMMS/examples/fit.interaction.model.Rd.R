library(SIMMS)


### Name: fit.interaction.model
### Title: Cox model two features separately and together
### Aliases: fit.interaction.model
### Keywords: survival

### ** Examples

data.dir <- get.program.defaults()[["test.data.dir"]];
data.types <- c("mRNA");
x1 <- load.cancer.datasets(
  datasets.to.load = c('Breastdata1'),
  data.types = data.types,
  data.directory = data.dir
  );
x2 <- fit.interaction.model(
  feature1 = "1000_at", 
  feature2 = "2549_at",
  expression.data = x1$all.data[[data.types[1]]],
  survival.data = x1$all.survobj
  );



