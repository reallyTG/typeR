library(analytics)


### Name: na.cleaner
### Title: Missing Value Imputation
### Aliases: na.cleaner

### ** Examples


mtcars_mod <- mtcars
set.seed(1)
mtcars_mod <- as.data.frame(lapply(mtcars_mod, function(cc) cc[ sample(c(TRUE, NA),
prob = c(0.6, 0.4), size = length(cc), replace = TRUE) ]))
rownames(mtcars_mod) <- rownames(mtcars)

# Compare methods
kNN_dt <- na.cleaner(dataset = mtcars_mod, Mode = "kNN")
mean_lm_dt <- na.cleaner(dataset = mtcars_mod, Mode = "mean&lm")
median_dt <- na.cleaner(dataset = mtcars_mod, Mode = "median")
all_dt <- na.cleaner(dataset = mtcars_mod, Mode = "all")
dev_kNN <- norm(as.matrix(mtcars[-c(4,6,8,13,18,20), -6])-as.matrix(kNN_dt))
dev_m_ml <- norm(as.matrix(mtcars[-c(4,6,8,13,18,20), -6])-as.matrix(mean_lm_dt))
dev_md <- norm(as.matrix(mtcars[-c(4,6,8,13,18,20), -6])-as.matrix(median_dt))
dev_all <- norm(as.matrix(mtcars[-c(4,6,8,13,18,20), -6])-as.matrix(all_dt))

iris_mod <- iris
set.seed(5)
iris_mod <- as.data.frame(lapply(iris_mod, function(cc) cc[ sample(c(TRUE, NA),
prob = c(0.6, 0.4), size = length(cc), replace = TRUE) ]))
rownames(iris_mod) <- rownames(iris)
na.cleaner(dataset = iris_mod, neigh = 1, Mode = "all")




