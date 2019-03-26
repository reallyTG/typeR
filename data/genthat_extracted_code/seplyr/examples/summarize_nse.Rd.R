library(seplyr)


### Name: summarize_nse
### Title: summarize non-standard evaluation interface.
### Aliases: summarize_nse summarise_nse

### ** Examples



datasets::iris %.>%
  summarize_nse(., Mean_Sepal_Length := mean(Sepal.Length),
                   Max_Sepal_Length := max(Sepal.Length))




