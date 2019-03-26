library(emil)


### Name: pre_impute_knn
### Title: Nearest neighbors imputation
### Aliases: pre_impute_knn

### ** Examples

x <- iris[-5]
x[sample(nrow(x), 30), 3] <- NA
my.dist <- dist(x)
evaluate(modeling_procedure("lda"), x = x, y = iris$Species,
    pre_process = function(...){
        pre_split(...) %>% pre_impute_knn(k = 4, distance_matrix = my.dist)
    }
)



