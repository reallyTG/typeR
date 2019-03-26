library(fsia)


### Name: fsia-package
### Title: Import and Analysis of OMR Data from FormScanner
### Aliases: fsia-package fsia
### Keywords: package

### ** Examples



# IMPORT DATA FROM FORMSCANNER
# find the directory with package fsia
dir_pkg <- find.package("fsia")
# the example files are in the directory examples
# create the path
questionnaire_path <- file.path(dir_pkg, "examples", "scan_results_questionnaire.csv")
test_path <- file.path(dir_pkg, "examples", "scan_results_test.csv")
# import file "scan_results_questionnaire.csv"
questionnaire_imp<-read.formscanner(questionnaire_path, dummy = "Q5.sources")
questionnaire_imp
# questionnaire_imp is equal to the data questionnaire
# import file "scan_results_test.csv"
test_imp <- read.formscanner(test_path, conc = paste("id", 1:6, sep = ""), id = "id1")
test_imp
# test_imp is equal to the data test

# ADD THE KEY
# create the path for file "key.csv"
key_path <- file.path(dir_pkg, "examples", "key.csv")
# add the key 
testk <- addkey(test_imp, keyfile = key_path)
testk$key

# ADD WEIGHTS
# create the path for file "weights.csv"
weights_path <- file.path(dir_pkg, "examples", "weights.csv")
# specify the weights for each correct response
testw <- addweights(testk, weightsfile = weights_path)
testw$weights
# create the path for file "weights_multiple.csv"
weights_mult_path <- file.path(dir_pkg, "examples", "weights_multiple.csv")
# specify the weights for each response
testwm <- addweights(test_imp, weightsfile = weights_mult_path)
testwm$weights

# CONVERT DATA TO BINARY VARIABLES
resp01 <- resp2binary(obj = testk, col = 2:41)
resp01[, 2:5]

# ASSIGN WEIGHTS TO RESPONSES
resps <- resp2scores(obj = testw, col =2:41)
resps[, 2:5]

# ASSIGN WEIGHTS TO RESPONSES (MULTIPLE WEIGHTS)
resps <- resp2scores(obj = testwm, col =2:41)
resps[, 2:5]

# PERSON STATISTICS (selected only 4 items)
pst <- person.stat(obj = testk, col = 2:5)
pst
pst <- person.stat(obj = testw, col = 2:5, weights = TRUE)
pst
pst <- person.stat(obj = testwm, col = 2:5, weights = TRUE)
pst

# ITEM STATISTICS
ist <- item.stat(obj = testk, col = 2:41)
head(ist)
ist <- item.stat(obj = testw, col = 2:41, weights = TRUE)
head(ist)
ist <- item.stat(obj = testwm, col = 2:41, weights = TRUE)
head(ist)

# FREQUENCIES OF THE RESPONSES
fr <- freq(obj = testk, col = c("Question03", "Question04"))
fr
par(mfrow = c(1, 2))
plot(fr, ask = FALSE)

# RESPONSES OF TWO SUBJECTS
par(mfrow = c(1, 2))
report(obj = testk, col = 2:11, whichid = c("102344", "245784"))
report(obj = testw, col = 2:11, whichid = c("102344", "245784"), weights = TRUE)
par(mfrow = c(1, 1))
report(obj = testwm, col = 2:11, whichid = c("102344", "245784"), weights = TRUE)



