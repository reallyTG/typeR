library(seplyr)


### Name: summarize_se
### Title: summarize standard interface.
### Aliases: summarize_se summarise_se

### ** Examples


# good
datasets::iris %.>%
  summarize_se(., qae(Mean_Sepal_Length := mean(Sepal.Length),
                      Max_Sepal_Length := max(Sepal.Length)))

# good
datasets::iris %.>%
  summarize_se(., qae(Sepal.Length := mean(Sepal.Length)))

# intentionally generates a warning
datasets::iris %.>%
  summarize_se(., qae(Sepal.Length := mean(Sepal.Length),
                      Max_Sepal_Length := max(Sepal.Length)))





