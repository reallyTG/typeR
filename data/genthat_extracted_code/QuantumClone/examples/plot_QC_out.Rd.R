library(QuantumClone)


### Name: plot_QC_out
### Title: Plot QC_output
### Aliases: plot_QC_out
### Keywords: Plot

### ** Examples

require(ggplot2)
message("Using preclustered data:")
QC_out<-QuantumClone::QC_output
plot_QC_out(QC_out,Sample_names = c("Diagnosis","Relapse"))




