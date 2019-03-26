library(broom)


### Name: tidy.roc
### Title: Tidy a(n) roc object
### Aliases: tidy.roc auc_tidiers roc_tidiers

### ** Examples


if (require("AUC", quietly = TRUE)) {
  data(churn)
  r <- roc(churn$predictions,churn$labels)

  td <- tidy(r)
  td

  library(ggplot2)
  
  ggplot(td, aes(fpr, tpr)) +
    geom_line()

  # compare the ROC curves for two prediction algorithms
  
  library(dplyr)
  library(tidyr)

  rocs <- churn %>%
    gather(algorithm, value, -labels) %>%
    nest(-algorithm) %>% 
    mutate(tidy_roc = purrr::map(data, ~tidy(roc(.x$value, .x$labels)))) %>% 
    unnest(tidy_roc)

  ggplot(rocs, aes(fpr, tpr, color = algorithm)) +
    geom_line()
}




