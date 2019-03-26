library(SIMMS)


### Name: calculate.network.coefficients
### Title: Calculate Cox statistics for input dataset
### Aliases: calculate.network.coefficients
### Keywords: survival

### ** Examples

options("warn" = -1);
program.data <- get.program.defaults(networks.database = "test");
data.directory <- program.data[["test.data.dir"]];
subnets.file.flattened <- program.data[["subnets.file.flattened"]];
coef.nodes.edges <- calculate.network.coefficients(
  data.directory = data.directory,
  output.directory = ".",
  training.datasets = c("Breastdata1"),
  data.types = c("mRNA"),
  subnets.file.flattened = subnets.file.flattened
  );



