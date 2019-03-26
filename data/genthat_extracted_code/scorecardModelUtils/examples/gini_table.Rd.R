library(scorecardModelUtils)


### Name: gini_table
### Title: Performance measure table with Gini coefficient, KS-statistics
###   and Gini lift curve
### Aliases: gini_table

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
set.seed(11)
data$Y_pred <- sample(300:900,size=nrow(data),replace=TRUE)
gini_tab_list <- gini_table(base = data,target = "Y",col_pred = "Y_pred",quantile_pt = 10)
gini_tab_list$prediction
gini_tab_list$gini_tab
gini_tab_list$gini_value
gini_tab_list$gini_plot
gini_tab_list$ks_value
gini_tab_list$breaks



