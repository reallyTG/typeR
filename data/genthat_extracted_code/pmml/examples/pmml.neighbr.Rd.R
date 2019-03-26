library(pmml)


### Name: pmml.neighbr
### Title: Generate PMML for a neighbr object from the *neighbr* package.
### Aliases: pmml.neighbr

### ** Examples

# continuous features with continuous target, categorical target,
# and neighbor ranking

## Not run: 
##D library(neighbr)
##D data(iris)
##D 
##D # add an ID column to the data for neighbor ranking
##D iris$ID <- c(1:150)
##D 
##D # train set contains all predicted variables, features, and ID column
##D train_set <- iris[1:140,]
##D 
##D # omit predicted variables or ID column from test set
##D test_set <- iris[141:150,-c(4,5,6)]
##D 
##D fit <- knn(train_set=train_set,test_set=test_set,
##D            k=3,
##D            categorical_target="Species",
##D            continuous_target= "Petal.Width",
##D            comparison_measure="squared_euclidean",
##D            return_ranked_neighbors=3,
##D            id="ID")
##D 
##D pmml(fit)
##D 
##D 
##D # logical features with categorical target and neighbor ranking
##D 
##D library(neighbr)
##D data("houseVotes84")
##D 
##D # remove any rows with N/A elements
##D dat <- houseVotes84[complete.cases(houseVotes84),]
##D 
##D # change all {yes,no} factors to {0,1}
##D feature_names <- names(dat)[!names(dat) %in% c("Class","ID")]
##D for (n in feature_names) {
##D   levels(dat[,n])[levels(dat[,n])=="n"] <- 0
##D   levels(dat[,n])[levels(dat[,n])=="y"] <- 1
##D }
##D 
##D # change factors to numeric
##D for (n in feature_names) {dat[,n] <- as.numeric(levels(dat[,n]))[dat[,n]]}
##D 
##D # add an ID column for neighbor ranking
##D dat$ID <- c(1:nrow(dat))
##D 
##D # train set contains features, predicted variable, and ID
##D train_set <- dat[1:225,]
##D 
##D # test set contains features only
##D test_set <- dat[226:232,!names(dat) %in% c("Class","ID")]
##D 
##D fit <- knn(train_set=train_set,test_set=test_set,
##D            k=5,
##D            categorical_target = "Class",
##D            comparison_measure="jaccard",
##D            return_ranked_neighbors=3,
##D            id="ID")
##D 
##D pmml(fit)
## End(Not run)




