library(edstan)


### Name: irt_data
### Title: Create a Stan data list from an item response matrix or from
###   long-form data.
### Aliases: irt_data

### ** Examples

# For a response matrix ("wide-form" data) with person covariates:
spelling_list <- irt_data(response_matrix = spelling[, 2:5],
                          covariates = spelling[, "male", drop = FALSE],
                          formula = ~ 1 + male)

# Alternatively, the same may be created by:
W <- cbind(intercept = 1, spelling[, "male"])
spelling_list <- irt_data(response_matrix = spelling[, 2:5],
                          covariates = W,
                          formula = NULL)

# For long-form data (one row per item-person pair):
agg_list_1 <- irt_data(y = aggression$poly,
                       ii = aggression$item,
                       jj = aggression$person)

# Add a latent regression and use labelled_integer() with the items
agg_list_2 <- irt_data(y = aggression$poly,
                       ii = labelled_integer(aggression$description),
                       jj = aggression$person,
                       covariates = aggression[, c("male", "anger")],
                       formula = ~ 1 + male*anger)



