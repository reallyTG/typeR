library(ggasym)


### Name: asymmetrise
### Title: Add all missing comparisons between two columns
### Aliases: asymmetrise asymmetrize

### ** Examples


df <- data.frame(a = c("A", "B", "C"),
                 b = c("C", "A", "B"),
                 untouched = c(1, 2, 3),
                 grouping_value = c("group1", "group1", "group2"),
                 stringsAsFactors = FALSE)
df

asymmetrise(df, a, b)

grouped_df <- dplyr::group_by(df, grouping_value)
asymmetrise(grouped_df, a, b)




