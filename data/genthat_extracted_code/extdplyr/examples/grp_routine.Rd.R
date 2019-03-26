library(extdplyr)


### Name: grp_routine
### Title: Mutate a character/factor based on conditions.
### Aliases: grp_routine grp_routine_

### ** Examples

df <- data.frame(v1 = letters[1:5], v2 = 1:5)
df

# By default, it creates new groups
grp_routine(df, "group",
               first = v1 %in% c("a", "b"),
               second = v2 == 3,
               third = v2 >= 4)

# Gives a warning when the groups are not collectively exhaustive
grp_routine(df, "group",
               first = v1 %in% c("a", "b"),
               second = v2 == 3,
               third = v2 > 4)


# SE version
grp_routine_(df, "group",
               "first" = ~ v1 %in% c("a", "b"),
               "second" = ~ v2 == 3,
               .dots = setNames(list(~ v2 > 4), "third"))



