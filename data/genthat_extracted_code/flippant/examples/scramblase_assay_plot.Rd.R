library(flippant)


### Name: scramblase_assay_input_template
### Title: scramblase_assay_plot
### Aliases: scramblase_assay_input_template scramblase_assay_plot
###   scramblaseAssayCalculations scramblase_assay_input_template
###   scramblase_assay_stats scramblase_assay_traces scramblase_assay_stats
###   scramblase_assay_traces

### ** Examples

## Not run: 
##D library(magrittr)
##D library(ggplot2)
##D # Extract example data
##D analysis_dir <- file.path(tempdir(), "flippant-case-study")
##D extract_case_study_data(analysis_dir)
##D template_file <- file.path(analysis_dir, "inputTable.txt")
##D # Plot the spectral traces
##D scramblase_assay_traces(
##D   template_file,
##D   time_max_sec = 350)
##D # Plot the PPR plot(s) faceting by experiment
##D scramblase_assay_plot(template_file)
##D # Generate tabular results
##D scramblase_assay_stats(template_file)
##D # Plot the PPR plot(s) forgoing faceting by experiment
##D scramblase_assay_plot(template_file, split_by_experiment = FALSE)
##D # Generate tabular results
##D scramblase_assay_stats(template_file, split_by_experiment = FALSE)
## End(Not run)



