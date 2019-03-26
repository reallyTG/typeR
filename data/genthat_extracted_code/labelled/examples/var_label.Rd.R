library(labelled)


### Name: var_label
### Title: Get / Set a variable label
### Aliases: var_label var_label<- set_variable_labels

### ** Examples

var_label(iris$Sepal.Length)
var_label(iris$Sepal.Length) <- 'Length of the sepal'
## Not run: 
##D  View(iris)
## End(Not run)
# To remove a variable label
var_label(iris$Sepal.Length) <- NULL
if (require(dplyr)) {
  # adding some variable labels
  df <- data_frame(s1 = c("M", "M", "F"), s2 = c(1, 1, 2)) %>%
    set_variable_labels(s1 = "Sex", s2 = "Yes or No?")
  var_label(df)

  # removing a variable label
  df <- df %>% set_variable_labels(s2 = NULL)
  var_label(df$s2)
}



