library(haven)


### Name: print_labels
### Title: Print the labels of a labelled vector
### Aliases: print_labels

### ** Examples

s1 <- labelled(c("M", "M", "F"), c(Male = "M", Female = "F"))
s2 <- labelled(c(1, 1, 2), c(Male = 1, Female = 2))
labelled_df <- tibble::data_frame(s1, s2)

for (var in names(labelled_df)) {
  print_labels(labelled_df[[var]], var)
}



