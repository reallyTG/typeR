library(emil)


### Name: factor_to_logical
### Title: Convert factors to logicals
### Aliases: factor_to_logical

### ** Examples

# Binary factor
email <- factor(sample(2, 20, TRUE), labels=c("unverified", "verified"))
factor_to_logical(email)

# Unordered multi-level factors
wine_preferences <- factor(sample(3, 20, TRUE), 
                           labels=c("red", "white", "none"))
factor_to_logical(wine_preferences, base="none")

fruit <- factor(sample(4, 20, TRUE),
                labels = c("apple", "banana", "cantaloup", "durian"))
fruit[sample(length(fruit), 3)] <- NA
factor_to_logical(fruit, drop=FALSE)

# Ordered factor
rating <- factor(1:5, labels = paste(1:5, "stars"), ordered=TRUE)
factor_to_logical(rating)

# Ordered factor with custom base
tie_break <- factor(1:5, 
                    labels=c("SetAlice", "AdvAlice", "Deuce", "AdvBob", "SetBob"),
                    ordered = TRUE)
tie_status <- as.data.frame(
    factor_to_logical(tie_break, base="Deuce", drop=FALSE)
)
print(tie_status)
tie_break[tie_status$AdvAlice]
tie_break[tie_status$SetBob]
tie_break[tie_status$Deuce]



