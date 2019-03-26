library(PivotalR)


### Name: madlib.glm
### Title: Generalized Linear Regression by MADlib in databases
### Aliases: madlib.glm
### Keywords: madlib stats

### ** Examples


## Not run: 
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D source_data <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D lk(source_data, 10)
##D 
##D ## linear regression conditioned on nation value
##D ## i.e. grouping
##D fit <- madlib.glm(rings ~ . -id | sex, data = source_data, heteroskedasticity = T)
##D fit
##D 
##D ## logistic regression
##D 
##D ## logistic regression
##D ## The dependent variable must be a logical variable
##D ## Here it is y < 10.
##D fit <- madlib.glm(rings < 10 ~ . - id - 1 , data = source_data, family = binomial)
##D 
##D fit <- madlib.glm(rings < 10 ~ sex + length + diameter,
##D data = source_data, family = "logistic")
##D 
##D ## 3rd example
##D ## The table has two columns: x is an array, y is double precision
##D dat <- source_data
##D dat$arr <- db.array(source_data[,-c(1,2)])
##D array.data <- as.db.data.frame(dat)
##D 
##D ## Fit to y using every element of x
##D ## This does not work in R's lm, but works in madlib.lm
##D fit <- madlib.glm(rings < 10 ~ arr, data = array.data, family = binomial)
##D 
##D fit <- madlib.glm(rings < 10 ~ arr - arr[1:2], data = array.data, family = binomial)
##D 
##D fit <- madlib.glm(rings < 10 ~ arr[1:7] + sex | id ##D 
##D 
##D fit <- madlib.glm(rings < 10 ~ arr - arr[8] + sex | id ##D 
##D 
##D ## 4th example
##D ## Step-wise feature selection
##D start <- madlib.glm(rings < 10 ~ . - id - sex, data = source_data, family = "binomial")
##D ## step(start)
##D 
##D ## ------------------------------------------------------------
##D ## Examples for using GLM model
##D 
##D fit <- madlib.glm(rings < 10 ~ . - id - sex, data = source_data, family = binomial(probit),
##D                   control = list(max.iter = 10))
##D 
##D fit <- madlib.glm(rings ~ . - id | sex, data = source_data, family = poisson(log),
##D                   control = list(max.iter = 10))
##D 
##D fit <- madlib.glm(rings ~ . - id, data = source_data, family = Gamma(inverse),
##D                   control = list(max.iter = 10))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



