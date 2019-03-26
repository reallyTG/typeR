## ----read_rearrangement, message=FALSE-----------------------------------
library(airr)

example_data <- system.file("extdata", "rearrangement-example.tsv.gz", package="airr")
basename(example_data)
airr_rearrangement <- read_rearrangement(example_data)
class(airr_rearrangement)
head(airr_rearrangement)

## ----write_rearrangement-------------------------------------------------
out_file <- file.path(tempdir(), "airr_out.tsv")
write_rearrangement(airr_rearrangement, out_file)

