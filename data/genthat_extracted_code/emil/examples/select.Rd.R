library(emil)


### Name: select
### Title: 'emil' and 'dplyr' integration
### Aliases: select select_.list

### ** Examples

# Produce some results
x <- iris[-5]
y <- iris$Species
names(y) <- sprintf("orchid%03i", seq_along(y))
cv <- resample("crossvalidation", y, nfold=3, nrepeat=2)
procedures <- list(nsc = modeling_procedure("pamr"),
                   rf = modeling_procedure("randomForest"))
result <- evaluate(procedures, x, y, resample=cv)

# Get the foldwise error for the NSC method
result %>% select(fold = TRUE, "nsc", error = "error")

# Compare both methods 
require(tidyr)
result %>%
    select(fold = TRUE, method = TRUE, error = "error") %>%
    spread(method, error)
require(dplyr)
result %>%
    select(fold = TRUE, method = TRUE, error = "error") %>%
    group_by(method) %>% summarize(mean_error = mean(error))

# Investigate the variability in estimated class 2 probability across folds
result %>%
    select(fold = cv, "nsc", "prediction", probability = function(x) x$probability[,2]) %>%
    spread(fold, probability)



