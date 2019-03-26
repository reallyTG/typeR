library(comperes)


### Name: convert-pair-value
### Title: Convert between long pair-value data and matrix
### Aliases: convert-pair-value long_to_mat mat_to_long

### ** Examples

long_data <- data.frame(
  key_1 = c("a", "a", "b"),
  key_2 = c("c", "d", "c"),
  val = 1:3,
  stringsAsFactors = FALSE
)

mat_data <- long_data %>% long_to_mat("key_1", "key_2", "val")
print(mat_data)

# Converts to tibble
mat_data %>% mat_to_long("new_key_1", "new_key_2", "new_val")

# Drops rows with valuus missing
mat_data %>% mat_to_long("new_key_1", "new_key_2", "new_val", drop = TRUE)




