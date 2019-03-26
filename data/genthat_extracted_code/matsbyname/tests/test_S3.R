
###########################################################
context("Creating a mat_byname")
###########################################################

# test_that("mat_byname works as expected", {
#   expect_error(mat_byname(NULL), "'data' must be of a vector type, was 'NULL'")
#   expect_true(is.na(mat_byname(NA)))
#   expect_equal(class(mat_byname(matrix(1:2))), c("mat_byname","matrix"))
#   mbn <- mat_byname(c("a", "b"), nrow = 2, ncol = 1)
#   expect_equal(mbn[1,1], "a")
#   expect_equal(mbn[2,1], "b")
#   expect_true(is.mat_byname(mbn))
#   expect_false(is.mat_byname(matrix(1:2)))
#   expect_true(is.mat_byname(as.mat_byname(matrix(1:2))))
# })


###########################################################
context("Adding mat_bynames")
###########################################################

# test_that("adding two mat_bynames with '+' works as expected", {
#   # one <- as.mat_byname(1)
#   # two <- as.mat_byname(2)
#   # expect_equal(one + two, 3)
#   
#   m1 <- matrix(c(1:4), 
#                nrow = 2, ncol = 2, byrow = TRUE, 
#                dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
#     setrowtype("row") %>% setcoltype("col")
#   m2 <- matrix(c(1:4), 
#                nrow = 2, ncol = 2, byrow = TRUE, 
#                dimnames = list(c("r2", "r1"), c("c2", "c1"))) %>% 
#     setrowtype("row") %>% setcoltype("col")
#   # Nonsensical, as row and column names are not respected
#   expect_equal(m1 + m2, 
#                matrix(c(2, 4, 
#                         6, 8), 
#                       nrow = 2, ncol = 2, byrow = TRUE, 
#                       dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
#                  setrowtype("row") %>% setcoltype("col"))
#   mbn1 <- as.mat_byname(m1)
#   mbn2 <- as.mat_byname(m2)
#   expected_mbn <- matrix(5, nrow = 2, ncol = 2, 
#                          dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
#     setrowtype("row") %>% setcoltype("col")
#   expect_equal(sum_byname(m1, m2), expected_mbn)
#   # expect_equal(mbn1 + mbn2, expected_mbn)
#   # expect_error(mbn1 + m2, "When adding mat_bynames with")
# })


