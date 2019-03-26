library(FeatureHashing)


### Name: hashed.model.matrix
### Title: Create a model matrix with feature hashing
### Aliases: hash.sign hashed.interaction.value hashed.model.matrix
###   hashed.value

### ** Examples

# The following scripts show how to fit a logistic regression
# after feature hashing
## Not run: 
##D data(ipinyou)
##D f <- ~ IP + Region + City + AdExchange + Domain +
##D  URL + AdSlotId + AdSlotWidth + AdSlotHeight +
##D  AdSlotVisibility + AdSlotFormat + CreativeID +
##D  Adid + split(UserTag, delim = ",")
##D # if the version of FeatureHashing is 0.8, please use the following command:
##D # m.train <- as(hashed.model.matrix(f, ipinyou.train, 2^16, transpose = FALSE), "dgCMatrix")
##D m.train <- hashed.model.matrix(f, ipinyou.train, 2^16)
##D m.test <- hashed.model.matrix(f, ipinyou.test, 2^16)
##D 
##D # logistic regression with glmnet
##D 
##D library(glmnet)
##D 
##D cv.g.lr <- cv.glmnet(m.train, ipinyou.train$IsClick,
##D  family = "binomial")#, type.measure = "auc")
##D p.lr <- predict(cv.g.lr, m.test, s="lambda.min")
##D auc(ipinyou.test$IsClick, p.lr)
##D 
##D ## Per-Coordinate FTRL-Proximal with $L_1$ and $L_2$ Regularization for Logistic Regression
##D 
##D # The following scripts use an implementation of the FTRL-Proximal for Logistic Regresion,
##D # which is published in McMahan, Holt and Sculley et al. (2013), to predict the probability
##D # (1-step prediction) and update the model simultaneously.
##D 
##D 
##D source(system.file("ftprl.R", package = "FeatureHashing"))
##D m.train <- hashed.model.matrix(f, ipinyou.train, 2^16, transpose = TRUE)
##D ftprl <- initialize.ftprl(0.1, 1, 0.1, 0.1, 2^16)
##D ftprl <- update.ftprl(ftprl, m.train, ipinyou.train$IsClick, predict = TRUE)
##D auc(ipinyou.train$IsClick, attr(ftprl, "predict"))
##D 
##D # If we use the same algorithm to predict the click through rate of the 3rd season of iPinYou,
##D # the overall AUC will be 0.77 which is comparable to the overall AUC of the
##D # 3rd season 0.76 reported in Zhang, Yuan, Wang, et al. (2014).
## End(Not run)

# The following scripts show the implementation of the FeatureHashing.

# Below the original values will be project in a space of 2^6 dimensions
m <- hashed.model.matrix(~ ., CO2, 2^6, create.mapping = TRUE,
 transpose = TRUE, is.dgCMatrix = FALSE)

# Print the matrix via dgCMatrix
as(m, "dgCMatrix")

# Extraction of the dictionary: values with their hash
mapping <- hash.mapping(m)

# To check the rate of collisions, we will extract the indices of the hash
# values through the modulo-division method, count how many duplicates
# we have (in best case it should be zero) and perform a mean.
mean(duplicated(mapping))

# The type of the result produced by the function `hashed.model.matrix`
# is a CSCMatrix. It supports simple subsetting
# and matrix-vector multiplication
rnorm(2^6) %*% m

# Detail of the hashing
# To hash one specific value, we can use the `hashed.value` function
# Below we will apply this function to the feature names
vectHash <- hashed.value(names(mapping))

# Now we will check that the result is the same than the one got with
# the more generation `hashed.model.matrix` function.
# We will use the Modulo-division method (that's the [%% 2^6] below)
# to find the address in hash table easily.
stopifnot(all(vectHash %% 2^6 + 1 == mapping))

# The sign is corrected by `hash.sign`
hash.sign(names(mapping))

## The interaction term is implemented as follow:
m2 <- hashed.model.matrix(~ .^2, CO2, 2^6, create.mapping = TRUE,
 transpose = TRUE, is.dgCMatrix = FALSE)
# The ^ operator indicates crossing to the specified degree.
# For example (a+b+c)^2 is identical to (a+b+c)*(a+b+c)
# which in turn expands to a formula containing the main effects
# for a, b and c together with their second-order interactions.

# Extract the mapping
mapping2 <- hash.mapping(m2)

# Get the hash of combination of two items, PlantQn2 and uptake
mapping2["PlantQn2:uptake"]

# Extract hash of each item
h1 <- hashed.value("PlantQn2")
h2 <- hashed.value("uptake")

# Computation of hash of both items combined
h3 <- hashed.value(rawToChar(c(intToRaw(h1), intToRaw(h2))))
stopifnot(h3 %% 2^6 + 1 == mapping2["PlantQn2:uptake"])

# The concatenated feature, i.e. the array<string> type in hive
data(test.tag)
df <- data.frame(a = test.tag, b = rnorm(length(test.tag)))
m <- hashed.model.matrix(~ split(a, delim = ",", type = "existence"):b, df, 2^6,
 create.mapping = TRUE)
# The column `a` is splitted by "," and have an interaction with "b":
mapping <- hash.mapping(m)
names(mapping)



