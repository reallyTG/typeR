library(healthcareai)


### Name: hcai_impute
### Title: Specify imputation methods for an existing recipe
### Aliases: hcai_impute

### ** Examples

library(recipes)

n = 100
set.seed(9)
d <- tibble::tibble(patient_id = 1:n,
            age = sample(c(30:80, NA), size = n, replace = TRUE),
            hemoglobin_count = rnorm(n, mean = 15, sd = 1),
            hemoglobin_category = sample(c("Low", "Normal", "High", NA),
                                         size = n, replace = TRUE),
            disease = ifelse(hemoglobin_count < 15, "Yes", "No")
)

# Initialize
my_recipe <- recipe(disease ~ ., data = d)

# Create recipe
my_recipe <- my_recipe %>%
  hcai_impute()
my_recipe

# Train recipe
trained_recipe <- prep(my_recipe, training = d)

# Apply recipe
data_modified <- bake(trained_recipe, new_data = d)
missingness(data_modified)


# Specify methods:
my_recipe <- my_recipe %>%
  hcai_impute(numeric_method = "bagimpute",
    nominal_method = "locfimpute")
my_recipe

# Specify methods and params:
my_recipe <- my_recipe %>%
  hcai_impute(numeric_method = "knnimpute",
    numeric_params = list(knn_K = 4))
my_recipe



