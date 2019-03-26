library(sboost)


### Name: validate
### Title: sboost Validation Function
### Aliases: validate

### ** Examples

# malware
validate(malware[-1], malware[1], iterations = 5, k_fold = 3, positive = 1)

# mushrooms
validate(mushrooms[-1], mushrooms[1], iterations = 5, k_fold = 3, positive = "p")



