library(recipes)


### Name: check_missing
### Title: Check for Missing Values
### Aliases: check_missing tidy.check_missing

### ** Examples

data(credit_data)
is.na(credit_data) %>% colSums()

# If the test passes, `new_data` is returned unaltered
recipe(credit_data) %>%
  check_missing(Age, Expenses) %>%
  prep() %>%
  bake(credit_data)

# If your training set doesn't pass, prep() will stop with an error

## Not run: 
##D recipe(credit_data)  %>%
##D   check_missing(Income) %>%
##D   prep()
## End(Not run)

# If `new_data` contain missing values, the check will stop bake()

train_data <- credit_data %>% dplyr::filter(Income > 150)
test_data  <- credit_data %>% dplyr::filter(Income <= 150 | is.na(Income))

rp <- recipe(train_data) %>%
  check_missing(Income) %>%
  prep()

bake(rp, train_data)
## Not run: 
##D bake(rp, test_data)
## End(Not run)



