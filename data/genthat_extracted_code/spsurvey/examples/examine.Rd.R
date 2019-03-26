library(spsurvey)


### Name: examine
### Title: Examine Data Frame Variables
### Aliases: examine
### Keywords: data frame

### ** Examples

df <- data.frame(SiteID = 1:100,
   Catvar = sample(LETTERS[1:5], 100, TRUE),
   Contvar = rnorm(100, 10, 1),
   Gender = rep(c("Male", "Female"), rep(50, 2)))
examine(df, ord = FALSE)
examine(df, "Gender", FALSE)



