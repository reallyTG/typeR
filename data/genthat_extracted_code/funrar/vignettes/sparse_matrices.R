## ----sparseMatExample----------------------------------------------------
# Generate a matrix with 1000 species and 200 sites
my_mat = matrix(sample(c(0, 0, 0, 0, 0, 0, 1), replace = TRUE, size = 200000),
                ncol = 1000, nrow = 200)
colnames(my_mat) = paste0("sp", 1:ncol(my_mat))
rownames(my_mat) = paste0("site", 1:nrow(my_mat))

my_mat[1:5, 1:5]

## ----estimateFilling-----------------------------------------------------
filling = 1 - sum(my_mat == 0)/(ncol(my_mat)*nrow(my_mat))

filling

## ----convertSparseMat----------------------------------------------------
library(Matrix)

sparse_mat = as(my_mat, "sparseMatrix")

is(my_mat, "sparseMatrix")
is(sparse_mat, "sparseMatrix")

## ----memoryUsage---------------------------------------------------------
# Regular Matrix
str(my_mat)
print(object.size(my_mat), units = "Kb")

# Sparse Matrix from 'Matrix' package
str(sparse_mat)
print(object.size(sparse_mat), units = "Kb")

## ----microBenchDist, eval = FALSE----------------------------------------
#  library(funrar)
#  
#  # Get a table of traits
#  trait_df = data.frame(trait = runif(ncol(my_mat), 0, 1))
#  rownames(trait_df) = paste0("sp", 1:ncol(my_mat))
#  
#  # Compute distance matrix
#  dist_mat = compute_dist_matrix(trait_df)
#  
#  if (requireNamespace("microbenchmark", quietly = TRUE)) {
#    microbenchmark::microbenchmark(
#      regular = distinctiveness(my_mat, dist_mat),
#      sparse = distinctiveness(sparse_mat, dist_mat))
#  }

## ----fillingInfluence----------------------------------------------------
generate_matrix = function(n_zero = 5, nrow = 200, ncol = 1000) {
  matrix(sample(c(rep(0, n_zero), 1), replace = TRUE, size = nrow*ncol),
                ncol = ncol, nrow = nrow)
}

mat_filling = function(my_mat) {
  sum(my_mat != 0)/(ncol(my_mat)*nrow(my_mat))
}

sparse_and_mat = function(n_zero) {
  my_mat = generate_matrix(n_zero)
  colnames(my_mat) = paste0("sp", 1:ncol(my_mat))
  rownames(my_mat) = paste0("site", 1:nrow(my_mat))
  
  sparse_mat = as(my_mat, "sparseMatrix")
  
  return(list(mat = my_mat, sparse = sparse_mat))
}

n_zero_vector = c(0, 1, 2, 49, 99)
names(n_zero_vector) = n_zero_vector

all_mats = lapply(n_zero_vector, sparse_and_mat)

mat_filling(all_mats$`0`$mat)
mat_filling(all_mats$`99`$mat)

## ---- eval=FALSE---------------------------------------------------------
#  if (requireNamespace("microbenchmark", quietly = TRUE)) {
#    mat_bench = microbenchmark::microbenchmark(
#      mat_0 = distinctiveness(all_mats$`0`$mat, dist_mat),
#      sparse_0 = distinctiveness(all_mats$`0`$sparse, dist_mat),
#      mat_1 = distinctiveness(all_mats$`1`$mat, dist_mat),
#      sparse_1 = distinctiveness(all_mats$`1`$sparse, dist_mat),
#      mat_2 = distinctiveness(all_mats$`2`$mat, dist_mat),
#      sparse_2 = distinctiveness(all_mats$`2`$sparse, dist_mat),
#      mat_49 = distinctiveness(all_mats$`49`$mat, dist_mat),
#      sparse_49 = distinctiveness(all_mats$`49`$sparse, dist_mat),
#      mat_99 = distinctiveness(all_mats$`99`$mat, dist_mat),
#      sparse_99 = distinctiveness(all_mats$`99`$sparse, dist_mat),
#      times = 5)
#  
#    autoplot(mat_bench)
#  }

