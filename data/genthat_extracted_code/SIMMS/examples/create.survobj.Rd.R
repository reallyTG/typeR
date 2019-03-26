library(SIMMS)


### Name: create.survobj
### Title: Utility function for loading meta-analysis lists
### Aliases: create.survobj
### Keywords: survival

### ** Examples

annotation.file <- paste(
  get.program.defaults()[["test.data.dir"]],
  "/Breastdata2/patient_annotation.txt", sep = ""
  );
annotation <- read.table(
  annotation.file,
  header = TRUE,
  row.names = 1,
  sep = "\t"
  );

# select the appropriate survtime and survstat variable for this dataset
annotation$survstat      <- annotation[,'e.dfs'];
annotation$survtime      <- annotation[,'t.dfs'];
annotation$survtime.unit <- annotation[,'t.dfs.unit'];

# only keep samples with survival data
annotation <- annotation[!is.na(annotation$survstat) & !is.na(annotation$survstat),];

surv.obj <- create.survobj(annotation = annotation);



