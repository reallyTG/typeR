library(AMR)


### Name: join
### Title: Join a table with 'microorganisms'
### Aliases: join inner_join_microorganisms inner_join
###   left_join_microorganisms right_join_microorganisms
###   full_join_microorganisms semi_join_microorganisms
###   anti_join_microorganisms

### ** Examples

left_join_microorganisms("STAAUR")

library(dplyr)
septic_patients %>% left_join_microorganisms()

df <- data.frame(date = seq(from = as.Date("2018-01-01"),
                            to = as.Date("2018-01-07"),
                            by = 1),
                 bacteria_id = c("STAAUR", "STAAUR", "STAAUR", "STAAUR",
                                 "ESCCOL", "ESCCOL", "ESCCOL"),
                 stringsAsFactors = FALSE)
colnames(df)
df2 <- left_join_microorganisms(df, "bacteria_id")
colnames(df2)



