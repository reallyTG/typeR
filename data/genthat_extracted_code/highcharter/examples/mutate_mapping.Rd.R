library(highcharter)


### Name: mutate_mapping
### Title: Modify data frame according to mapping
### Aliases: mutate_mapping

### ** Examples


df <- head(mtcars)
mutate_mapping(data = df, mapping = hcaes(x = cyl, y = wt + cyl, group = gear))
mutate_mapping(data = df, mapping = hcaes(x = cyl, y = wt), drop = TRUE)




