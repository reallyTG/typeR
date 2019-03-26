library(SIMMS)


### Name: prepare.training.validation.datasets
### Title: Prepare training and validation datasets
### Aliases: prepare.training.validation.datasets
### Keywords: IO

### ** Examples

# get data directory 
data.directory <- get.program.defaults()[["test.data.dir"]];

# initialise params
output.directory <- ".";
data.types <- c("mRNA");
feature.selection.datasets <- c("Breastdata1");
training.datasets <- c("Breastdata1");
validation.datasets <- c("Breastdata1", "Breastdata2");

# preparing training and validation datasets.
# Normalisation & patientwise subnet feature scores
prepare.training.validation.datasets(
  data.directory = data.directory,
  output.directory = output.directory,
  data.types =  data.types,
  feature.selection.datasets = feature.selection.datasets,
  datasets = unique(c(training.datasets, validation.datasets)),
  networks.database = "test"
  );



