library(exams)


### Name: exams2pdf
### Title: Generation of Exams in PDF Format
### Aliases: exams2pdf make_exams_write_pdf
### Keywords: utilities

### ** Examples

## load package and enforce par(ask = FALSE)
options(device.ask.default = FALSE)

if(interactive()) {
## compile a single random exam (displayed on screen)
exams2pdf(list(
  "boxplots",
  c("tstat", "ttest", "confint"),
  c("regression", "anova"),
  "scatterplot",
  "relfreq"
))
}



