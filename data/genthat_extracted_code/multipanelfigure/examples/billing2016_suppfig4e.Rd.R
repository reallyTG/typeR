library(multipanelfigure)


### Name: billing2016_suppfig4e
### Title: Mass spectrometry intensities by stem cell type and organelle
### Aliases: billing2016_suppfig4e

### ** Examples

ggplot2::ggplot(billing2016_suppfig4e, ggplot2::aes(Experiment, Intensity)) +
  ggplot2::geom_bar(stat = "identity") +
  ggplot2::geom_vline(xintercept = seq(3.5, 24.5, 3), linetype = "dotted") +
  ggplot2::facet_wrap(~ GeneName) +
  ggplot2::xlab(NULL) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 4))



