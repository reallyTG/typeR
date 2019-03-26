library(lavaan)


### Name: lav_matrix
### Title: Utility Functions: Matrices and Vectors
### Aliases: lav_matrix_vec lav_matrix_vecr lav_matrix_vech
###   lav_matrix_vechr lav_matrix_vechu lav_matrix_vechru
###   lav_matrix_vech_idx lav_matrix_vech_row_idx lav_matrix_vech_col_idx
###   lav_matrix_vechr_idx lav_matrix_vechu_idx lav_matrix_vechru_idx
###   lav_matrix_vech_reverse lav_matrix_vechru_reverse
###   lav_matrix_upper2full lav_matrix_vechr_reverse
###   lav_matrix_vechu_reverse lav_matrix_lower2full lav_matrix_diag_idx
###   lav_matrix_diagh_idx lav_matrix_antidiag_idx lav_matrix_duplication
###   lav_matrix_duplication_pre lav_matrix_duplication_post
###   lav_matrix_duplication_pre_post lav_matrix_duplication_ginv
###   lav_matrix_duplication_ginv_pre lav_matrix_duplication_ginv_post
###   lav_matrix_duplication_ginv_pre_post lav_matrix_commutation
###   lav_matrix_commutation_pre lav_matrix_commutation_mn_pre
###   lav_matrix_symmetric_sqrt lav_matrix_orthogonal_complement
###   lav_matrix_bdiag lav_matrix_trace lav_matrix_cov

### ** Examples

# upper elements of a 3 by 3 symmetric matrix (row by row)
x <- c(30, 16, 5, 10, 3, 1)
# construct full symmetric matrix
S <- lav_matrix_upper2full(x)

# compute the normal theory `Gamma' matrix given a covariance
# matrix (S), using the formula: Gamma = 2 * D^{+} (S %x% S) t(D^{+})
Gamma.NT <- 2 * lav_matrix_duplication_ginv_pre_post(S %x% S)
Gamma.NT



