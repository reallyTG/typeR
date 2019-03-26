library(teigen)


### Name: teigen
### Title: teigen: Function for Model-Based Clustering and Classification
###   with the Multivariate t Distribution
### Aliases: teigen

### ** Examples

###Note that only one model is run for each example
###in order to reduce computation time

#Clustering old faithful data with hard random start
tfaith <- teigen(faithful, models="UUUU", Gs=1:3, init="hard")
plot(tfaith, what = "uncertainty")
summary(tfaith)

#Clustering old faithful with hierarchical starting values
initial_list <- list()
clustree <- hclust(dist(faithful))
for(i in 1:3){
	initial_list[[i]] <- cutree(clustree,i)
}
tfaith <- teigen(faithful, models="CUCU", Gs=1:3, init=initial_list)
print(tfaith)

#Classification with the iris data set
#Introducing NAs is not required; this is to illustrate a `true' classification scenario
irisknown <- iris[,5]
irisknown[134:150] <- NA
triris <- teigen(iris[,-5], models="CUUU", init="uniform", known=irisknown)

##Parallel examples:
###Note: parallel.cores set to 2 in order to comply
###with CRAN submission policies (set to higher
###number or TRUE to automatically use all available cores)

#Clustering old faithful data with tEIGEN
tfaith <- teigen(faithful, models="UUUU",
parallel.cores=2, Gs=1:3, init="hard")
plot(tfaith, what = "contour")

#Classification with the iris data set 
irisknown <- iris[,5]
irisknown[sample(1:nrow(iris),50)] <- NA
tiris <- teigen(iris[,-5], parallel.cores=2, models="CUUU",
init="uniform", known=irisknown)
tiris$tab



