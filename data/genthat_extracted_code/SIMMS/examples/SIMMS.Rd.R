library(SIMMS)


### Name: SIMMS-package
### Title: SIMMS - Subnetwork Integration for Multi-Modal Signatures
### Aliases: SIMMS-package SIMMS
### Keywords: package

### ** Examples

options("warn" = -1);

# get data directory 
data.directory <- get.program.defaults(networks.database = "test")[["test.data.dir"]];

# initialise params
output.directory <- ".";
data.types <- c("mRNA");
feature.selection.datasets <- c("Breastdata1");
training.datasets <- c("Breastdata1");
validation.datasets <- c("Breastdata2");
feature.selection.p.thresholds <- c(0.5);
feature.selection.p.threshold <- 0.5;
learning.algorithms <- c("backward", "forward", "glm");
top.n.features <- 5;

# compute network HRs for all the subnet features
derive.network.features(
  data.directory = data.directory,
  output.directory = output.directory,
  data.types = data.types,
  feature.selection.datasets = feature.selection.datasets,
  feature.selection.p.thresholds = feature.selection.p.thresholds,
  networks.database = "test"
  );

# preparing training and validation datasets.
# Normalisation & patientwise subnet feature scores
prepare.training.validation.datasets(
  data.directory = data.directory,
  output.directory = output.directory,
  data.types = data.types,
  feature.selection.datasets = feature.selection.datasets,
  datasets = unique(c(training.datasets, validation.datasets)),
  networks.database = "test"
  );

# create classifier assessing univariate prognostic power of subnetwork modules (Train and Validate)
create.classifier.univariate(
  data.directory = data.directory,
  output.directory = output.directory,
  feature.selection.datasets = feature.selection.datasets,
  feature.selection.p.threshold = feature.selection.p.threshold,
  training.datasets = training.datasets,
  validation.datasets = validation.datasets,
  top.n.features = top.n.features
  );

# create a multivariate classifier (Train and Validate)
create.classifier.multivariate(
  data.directory = data.directory,
  output.directory = output.directory,
  feature.selection.datasets = feature.selection.datasets,
  feature.selection.p.threshold = feature.selection.p.threshold,
  training.datasets = training.datasets,
  validation.datasets = validation.datasets,
  learning.algorithms = learning.algorithms,
  top.n.features = top.n.features
  );

# (optional) plot Kaplan-Meier survival curves and perform senstivity analysis
if (FALSE){
  create.survivalplots(
    data.directory = data.directory,
    output.directory = output.directory,
    training.datasets = training.datasets,
    validation.datasets = validation.datasets,
    top.n.features = top.n.features,
    learning.algorithms = learning.algorithms,
    survtime.cutoffs = c(5),
    KM.plotting.fun = "create.KM.plot",
    resolution = 100
    );
  }



