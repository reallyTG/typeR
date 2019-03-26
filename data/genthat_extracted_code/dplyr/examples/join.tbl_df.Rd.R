library(dplyr)


### Name: nest_join.data.frame
### Title: Join data frame tbls
### Aliases: nest_join.data.frame join.tbl_df inner_join.tbl_df
###   nest_join.tbl_df left_join.tbl_df right_join.tbl_df full_join.tbl_df
###   semi_join.tbl_df anti_join.tbl_df

### ** Examples

if (require("Lahman")) {
batting_df <- tbl_df(Batting)
person_df <- tbl_df(Master)

uperson_df <- tbl_df(Master[!duplicated(Master$playerID), ])

# Inner join: match batting and person data
inner_join(batting_df, person_df)
inner_join(batting_df, uperson_df)

# Left join: match, but preserve batting data
left_join(batting_df, uperson_df)

# Anti join: find batters without person data
anti_join(batting_df, person_df)
# or people who didn't bat
anti_join(person_df, batting_df)
}



