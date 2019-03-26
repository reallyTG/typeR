library(refinr)


### Name: key_collision_merge
### Title: Value merging based on Key Collision
### Aliases: key_collision_merge

### ** Examples

x <- c("Acme Pizza, Inc.", "ACME PIZZA COMPANY", "pizza, acme llc",
       "Acme Pizza, Inc.")
key_collision_merge(vect = x)

# Use parameter "dict" to influence how clustered values are edited.
key_collision_merge(vect = x, dict = c("Nicks Pizza", "acme PIZZA inc"))

# Use parameter 'ignore_strings' to ignore specific strings during merging
# of values.
x <- c("Bakersfield Highschool", "BAKERSFIELD high",
       "high school, bakersfield")
key_collision_merge(x, ignore_strings = c("high", "school", "highschool"))




