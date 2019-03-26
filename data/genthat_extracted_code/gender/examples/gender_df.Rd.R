library(gender)


### Name: gender_df
### Title: Use gender prediction with data frames
### Aliases: gender_df

### ** Examples

library(dplyr)
demo_df <- data_frame(names = c("Hillary", "Hillary", "Hillary",
                                "Madison", "Madison"),
                      birth_year = c(1930, 2000, 1930, 1930, 2000),
                      min_year = birth_year - 1,
                      max_year = birth_year + 1,
                      stringsAsFactors = FALSE)

# Using the birth year for the predictions.
# Notice that the duplicate value for Hillary in 1930 is removed
gender_df(demo_df, method = "demo",
          name_col = "names", year_col = "birth_year")

# Using a range of years
gender_df(demo_df, method = "demo",
          name_col = "names", year_col = c("min_year", "max_year"))



