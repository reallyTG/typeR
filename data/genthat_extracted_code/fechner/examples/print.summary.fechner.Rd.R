library(fechner)


### Name: print.summary.fechner
### Title: Print Method for Objects of Class summary.fechner
### Aliases: print.summary.fechner
### Keywords: methods print

### ** Examples

## Fechnerian scaling of dataset morse
## summary information about the Fechnerian scaling object are printed
## accessing detailed summary through assignment
(detailed.summary <- summary(fechner(morse, format = "percent.same")))
str(detailed.summary)
detailed.summary$pairs.used.for.comparison[3, ]



