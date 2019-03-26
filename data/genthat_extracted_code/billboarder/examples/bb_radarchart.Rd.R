library(billboarder)


### Name: bb_radarchart
### Title: Helper for creating a radar chart
### Aliases: bb_radarchart

### ** Examples

library("billboarder")

# data about Avengers
data("avengers_wide")

# if not specified, first column is used as x-axis, 
# all others are used on y-axis
billboarder() %>%
  bb_radarchart(data = avengers_wide)

# specify explicitly which column to use with mapping
billboarder() %>%
  bb_radarchart(
    data = avengers_wide,
    mapping = bbaes(x = axis, y = `Captain America`)
  )


# with data in "long" format you can use "group" aesthetics
data("avengers")
billboarder() %>%
  bb_radarchart(
    data = avengers, 
    mapping = bbaes(x = axis, y = value, group = group)
  )



