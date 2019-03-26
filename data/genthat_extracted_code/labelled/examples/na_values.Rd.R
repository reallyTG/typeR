library(labelled)


### Name: na_values
### Title: Get / Set SPSS missing values
### Aliases: na_values na_values<- na_range na_range<- set_na_values
###   set_na_range

### ** Examples

v <- labelled(c(1,2,2,2,3,9,1,3,2,NA), c(yes = 1, no = 3, "don't know" = 9))
v
na_values(v) <- 9
na_values(v)
v
na_values(v) <- NULL
v
na_range(v) <- c(5, Inf)
na_range(v)
v
if (require(dplyr)) {
  # setting value labels
  df <- data_frame(s1 = c("M", "M", "F", "F"), s2 = c(1, 1, 2, 9)) %>%
    set_value_labels(s2 = c(yes = 1, no = 2)) %>%
    set_na_values(s2 = 9)
  na_values(df)

  # removing missing values
  df <- df %>% set_na_values(s2 = NULL)
  df$s2
}



