library(lplyr)


### Name: take
### Title: Subset data frames
### Aliases: take take_ take_.data.frame take_.tbl_df

### ** Examples

df <- mtcars[1:10,]
take(df, cyl %in% c(4, 6), mpg, disp)
take_(df, ~ cyl %in% c(4, 6), ~ mpg, ~ disp)
take_(df, ~ cyl %in% c(4, 6), .dots = c("mpg", "disp"))




