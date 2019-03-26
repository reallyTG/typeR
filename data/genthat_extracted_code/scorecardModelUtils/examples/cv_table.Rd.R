library(scorecardModelUtils)


### Name: cv_table
### Title: Pairwise Cramer's V among a list of categorical variables
### Aliases: cv_table

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
data$Sepal.Length <- as.character(floor(data$Sepal.Length))
cv_tab_list <- cv_table(data, c("Species", "Sepal.Length"))
cv_tab_list$cv_val_tab
cv_tab_list$single_class_var_index



