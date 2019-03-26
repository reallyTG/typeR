library(understandBPMN)


### Name: calculate_metrics
### Title: A calculation function for all metrics
### Aliases: calculate_metrics

### ** Examples

## Don't show: 
file_path <- system.file("extdata", "doc.txt", package="understandBPMN")
repetition_and_path_log <- create_path_and_repetition_log(file_path)
## End(Don't show)
calculate_metrics(file_path, generate_new_path_log = TRUE)



