library(labelled)


### Name: val_labels
### Title: Get / Set value labels
### Aliases: val_labels val_labels.default val_labels.labelled
###   val_labels.data.frame val_labels<- val_labels<-.numeric
###   val_labels<-.character val_labels<-.labelled
###   val_labels<-.labelled_spss val_labels<-.data.frame val_label
###   val_label.labelled val_label.data.frame val_label<-
###   val_label<-.labelled val_label<-.numeric val_label<-.character
###   val_label<-.data.frame set_value_labels add_value_labels
###   remove_value_labels

### ** Examples

v <- labelled(c(1,2,2,2,3,9,1,3,2,NA), c(yes = 1, no = 3, "don't know" = 9))
val_labels(v)
val_labels(v, prefixed = TRUE)
val_label(v, 2)
val_label(v, 2) <- 'maybe'
val_label(v, 9) <- NULL
val_labels(v) <- NULL
if (require(dplyr)) {
  # setting value labels
  df <- data_frame(s1 = c("M", "M", "F"), s2 = c(1, 1, 2)) %>%
    set_value_labels(s1 = c(Male = "M", Female = "F"), s2 = c(Yes = 1, No = 2))
  val_labels(df)

  # updating value labels
  df <- df %>% add_value_labels(s2 = c(Unknown = 9))
  df$s2

  # removing a value labels
  df <- df %>% remove_value_labels(s2 = 9)
  df$s2

  # removing all value labels
  df <- df %>% set_value_labels(s2 = NULL)
  df$s2
}



