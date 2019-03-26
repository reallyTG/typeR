context("Matrix creation")

# sample data
a <- sample(1:10, 10, replace=TRUE)
b <- sample(1:10, 10, replace=TRUE)
c <- letters[sample(1:10, 10, replace=TRUE)]
d <- letters[sample(1:5, 10, replace=TRUE)]
df1 <- data.frame(A=a, B=b, C=c, D=d, stringsAsFactors=FALSE)
df2 <- tibble::tibble(A=a, B=b, C=c, D=d)

mat1 <- matrix(sample(1:10, 40, replace=TRUE), ncol=4)
colnames(mat1) <- c('A', "B", "C", "D")

form1 <- A ~ B + C
form2 <- A ~ B + C + D


test_that("A formula is built", {
    # correct class
    expect_s3_class(build.formula('y', 'x'), 'formula')
    expect_s3_class(build.formula('', 'x'), 'formula')
    
    # correct length
    expect_equal(length(build.formula('y', 'x')), 3)
    expect_equal(length(build.formula('', 'x')), 2)
    
    # test for the right errors
    expect_error(build.formula('y', ''))
})

test_that("ForceDataFrame converts and doesn't when appropriate", {
    expect_s3_class(ForceDataFrame(df1), 'data.frame')
    expect_s3_class(ForceDataFrame(df2), 'data.frame')
    expect_s3_class(ForceDataFrame(df2), 'tbl')
    expect_s3_class(ForceDataFrame(mat1), 'data.frame')
})

test_that('The y vector is built', {
    expect_true(is.vector(build.y(form1, data=df1)))
    expect_true(is.vector(build.y(form1, data=df2)))
    expect_true(is.vector(build.y(form1, data=mat1)))
    
    expect_length(build.y(form1, data=df1), nrow(df1))
    expect_length(build.y(form1, data=df2), nrow(df2))
    expect_length(build.y(form1, data=mat1), nrow(mat1))
    
    expect_equal(build.y(form1, data=df1), a)
    expect_equal(build.y(form1, data=df2), a)
    expect_equal(build.y(form1, data=mat1), mat1[, 1])
})


test_that('The x matrix is built with contrasts with one categorical variable', {
    # df1
    expect_is(build.x(form1, df1), 'matrix')
    expect_is(build.x(form1, df1, contrasts=TRUE), 'matrix')
    
    expect_equal(nrow(build.x(form1, df1)), nrow(df1))
    expect_equal(nrow(build.x(form1, df1, contrasts=TRUE)), nrow(df1))
    
    expect_equal(ncol(build.x(form1, df1)), 1 + 1 + length(unique(df1$C)) - 1)
    expect_equal(ncol(build.x(form1, df1, contrasts=TRUE)), 1 + 1 + length(unique(df1$C)) - 1)
    
    # df2
    expect_is(build.x(form1, df2), 'matrix')
    expect_is(build.x(form1, df2, contrasts=TRUE), 'matrix')
    
    expect_equal(nrow(build.x(form1, df2)), nrow(df2))
    expect_equal(nrow(build.x(form1, df2, contrasts=TRUE)), nrow(df2))
    
    expect_equal(ncol(build.x(form1, df2)), 1 + 1 + length(unique(df2$C)) - 1)
    expect_equal(ncol(build.x(form1, df2, contrasts=TRUE)), 1 + 1 + length(unique(df2$C)) - 1)
    
    # mat1
    expect_is(build.x(form1, mat1), 'matrix')
    expect_is(build.x(form1, mat1, contrasts=TRUE), 'matrix')
    
    expect_equal(nrow(build.x(form1, mat1)), nrow(mat1))
    expect_equal(nrow(build.x(form1, mat1, contrasts=TRUE)), nrow(mat1))
    
    expect_equal(ncol(build.x(form1, mat1)), 1 + 1 + 1)
    expect_equal(ncol(build.x(form1, mat1, contrasts=TRUE)), 1 + 1 + 1)
})


test_that('The x matrix is built without contrasts with one categorical variable', {
    # df1
    expect_is(build.x(form1, df1, contrasts=FALSE), 'matrix')
    
    expect_equal(nrow(build.x(form1, df1, contrasts=FALSE)), nrow(df1))
    
    expect_equal(ncol(build.x(form1, df1, contrasts=FALSE)), 1 + 1 + length(unique(df1$C)))
    
    # df2
    expect_is(build.x(form1, df2, contrasts=FALSE), 'matrix')
    
    expect_equal(nrow(build.x(form1, df2, contrasts=FALSE)), nrow(df2))
    
    expect_equal(ncol(build.x(form1, df2, contrasts=FALSE)), 1 + 1 + length(unique(df2$C)))
    
    # mat1
    expect_is(build.x(form1, mat1, contrasts=FALSE), 'matrix')
    
    expect_equal(nrow(build.x(form1, mat1, contrasts=FALSE)), nrow(mat1))
    
    expect_equal(ncol(build.x(form1, mat1, contrasts=FALSE)), 1 + 1 + 1)
})

test_that('The x matrix is built with contrasts with two categorical variables', {
    # df1
    expect_is(build.x(form2, df1), 'matrix')
    expect_is(build.x(form2, df1, contrasts=TRUE), 'matrix')
    
    expect_equal(nrow(build.x(form2, df1)), nrow(df1))
    expect_equal(nrow(build.x(form2, df1, contrasts=TRUE)), nrow(df1))
    
    expect_equal(ncol(build.x(form2, df1)), 1 + 1 + length(unique(df1$C)) - 1 + length(unique(df1$D)) - 1)
    expect_equal(ncol(build.x(form2, df1, contrasts=TRUE)), 1 + 1 + length(unique(df1$C)) - 1 + length(unique(df1$D)) - 1)
    
    # df2
    expect_is(build.x(form2, df2), 'matrix')
    expect_is(build.x(form2, df2, contrasts=TRUE), 'matrix')
    
    expect_equal(nrow(build.x(form2, df2)), nrow(df2))
    expect_equal(nrow(build.x(form2, df2, contrasts=TRUE)), nrow(df2))
    
    expect_equal(ncol(build.x(form2, df2)), 1 + 1 + length(unique(df2$C)) - 1 + length(unique(df2$D)) - 1)
    expect_equal(ncol(build.x(form2, df2, contrasts=TRUE)), 1 + 1 + length(unique(df2$C)) - 1 + length(unique(df2$D)) - 1)
    
    # mat1
    expect_is(build.x(form2, mat1), 'matrix')
    expect_is(build.x(form2, mat1, contrasts=TRUE), 'matrix')
    
    expect_equal(nrow(build.x(form2, mat1)), nrow(mat1))
    expect_equal(nrow(build.x(form2, mat1, contrasts=TRUE)), nrow(mat1))
    
    expect_equal(ncol(build.x(form2, mat1)), 1 + 1 + 1 + 1)
    expect_equal(ncol(build.x(form2, mat1, contrasts=TRUE)), 1 + 1 + 1 + 1)
})


test_that('The x matrix is built without contrasts with two categorical variables', {
    # df1
    expect_is(build.x(form2, df1, contrasts=FALSE), 'matrix')
    
    expect_equal(nrow(build.x(form2, df1, contrasts=FALSE)), nrow(df1))
    
    expect_equal(ncol(build.x(form2, df1, contrasts=FALSE)), 1 + 1 + length(unique(df1$C)) + length(unique(df2$D)))
    
    # df2
    expect_is(build.x(form1, df2, contrasts=FALSE), 'matrix')
    
    expect_equal(nrow(build.x(form2, df2, contrasts=FALSE)), nrow(df2))
    
    expect_equal(ncol(build.x(form2, df2, contrasts=FALSE)), 1 + 1 + length(unique(df2$C)) + length(unique(df2$D)))
    
    # mat1
    expect_is(build.x(form1, mat1, contrasts=FALSE), 'matrix')
    
    expect_equal(nrow(build.x(form1, mat1, contrasts=FALSE)), nrow(mat1))
    
    expect_equal(ncol(build.x(form1, mat1, contrasts=FALSE)), 1 + 1 + 1)
})

###################################
## Sparse Tests
###################################


test_that('The sparse x matrix is built with contrasts with one categorical variable', {
    # df1
    expect_is(build.x(form1, df1, sparse=TRUE), 'dgCMatrix')
    expect_is(build.x(form1, df1, contrasts=TRUE, sparse=TRUE), 'dgCMatrix')

    expect_equal(nrow(build.x(form1, df1, sparse=TRUE)), nrow(df1))
    expect_equal(nrow(build.x(form1, df1, contrasts=TRUE, sparse=TRUE)), nrow(df1))

    expect_equal(ncol(build.x(form1, df1, sparse=TRUE)), 1 + 1 + length(unique(df1$C)) - 1)
    expect_equal(ncol(build.x(form1, df1, contrasts=TRUE, sparse=TRUE)), 1 + 1 + length(unique(df1$C)) - 1)

    # df2
    expect_is(build.x(form1, df2, sparse=TRUE), 'dgCMatrix')
    expect_is(build.x(form1, df2, contrasts=TRUE, sparse=TRUE), 'dgCMatrix')

    expect_equal(nrow(build.x(form1, df2, sparse=TRUE)), nrow(df2))
    expect_equal(nrow(build.x(form1, df2, contrasts=TRUE, sparse=TRUE)), nrow(df2))

    expect_equal(ncol(build.x(form1, df2, sparse=TRUE)), 1 + 1 + length(unique(df2$C)) - 1)
    expect_equal(ncol(build.x(form1, df2, contrasts=TRUE, sparse=TRUE)), 1 + 1 + length(unique(df2$C)) - 1)

    # mat1
    expect_is(build.x(form1, mat1, sparse=TRUE), 'dgCMatrix')
    expect_is(build.x(form1, mat1, contrasts=TRUE, sparse=TRUE), 'dgCMatrix')

    expect_equal(nrow(build.x(form1, mat1, sparse=TRUE)), nrow(mat1))
    expect_equal(nrow(build.x(form1, mat1, contrasts=TRUE, sparse=TRUE)), nrow(mat1))

    expect_equal(ncol(build.x(form1, mat1, sparse=TRUE)), 1 + 1 + 1)
    expect_equal(ncol(build.x(form1, mat1, contrasts=TRUE, sparse=TRUE)), 1 + 1 + 1)
})

test_that('The sparse x matrix is built without contrasts with one categorical variable', {
    # df1
    expect_is(build.x(form1, df1, contrasts=FALSE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form1, df1, contrasts=FALSE, sparse=TRUE)), nrow(df1))
    
    expect_equal(ncol(build.x(form1, df1, contrasts=FALSE, sparse=TRUE)), 1 + 1 + length(unique(df1$C)))
    
    # df2
    expect_is(build.x(form1, df2, contrasts=FALSE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form1, df2, contrasts=FALSE, sparse=TRUE)), nrow(df2))
    
    expect_equal(ncol(build.x(form1, df2, contrasts=FALSE, sparse=TRUE)), 1 + 1 + length(unique(df2$C)))
    
    # mat1
    expect_is(build.x(form1, mat1, contrasts=FALSE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form1, mat1, contrasts=FALSE, sparse=TRUE)), nrow(mat1))
    
    expect_equal(ncol(build.x(form1, mat1, contrasts=FALSE, sparse=TRUE)), 1 + 1 + 1)
})

test_that('The sparse x matrix is built with contrasts with two categorical variables', {
    # df1
    expect_is(build.x(form2, df1, sparse=TRUE), 'dgCMatrix')
    expect_is(build.x(form2, df1, contrasts=TRUE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form2, df1, sparse=TRUE)), nrow(df1))
    expect_equal(nrow(build.x(form2, df1, contrasts=TRUE, sparse=TRUE)), nrow(df1))
    
    expect_equal(ncol(build.x(form2, df1, sparse=TRUE)), 1 + 1 + length(unique(df1$C)) - 1 + length(unique(df1$D)) - 1)
    expect_equal(ncol(build.x(form2, df1, contrasts=TRUE, sparse=TRUE)), 1 + 1 + length(unique(df1$C)) - 1 + length(unique(df1$D)) - 1)
    
    # df2
    expect_is(build.x(form2, df2, sparse=TRUE), 'dgCMatrix')
    expect_is(build.x(form2, df2, contrasts=TRUE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form2, df2, sparse=TRUE)), nrow(df2))
    expect_equal(nrow(build.x(form2, df2, contrasts=TRUE, sparse=TRUE)), nrow(df2))
    
    expect_equal(ncol(build.x(form2, df2, sparse=TRUE)), 1 + 1 + length(unique(df2$C)) - 1 + length(unique(df2$D)) - 1)
    expect_equal(ncol(build.x(form2, df2, contrasts=TRUE, sparse=TRUE)), 1 + 1 + length(unique(df2$C)) - 1 + length(unique(df2$D)) - 1)
    
    # mat1
    expect_is(build.x(form2, mat1, sparse=TRUE), 'dgCMatrix')
    expect_is(build.x(form2, mat1, contrasts=TRUE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form2, mat1, sparse=TRUE)), nrow(mat1))
    expect_equal(nrow(build.x(form2, mat1, contrasts=TRUE, sparse=TRUE)), nrow(mat1))
    
    expect_equal(ncol(build.x(form2, mat1, sparse=TRUE)), 1 + 1 + 1 + 1)
    expect_equal(ncol(build.x(form2, mat1, contrasts=TRUE, sparse=TRUE)), 1 + 1 + 1 + 1)
})


test_that('The sparse x matrix is built without contrasts with two categorical variables', {
    # df1
    expect_is(build.x(form2, df1, contrasts=FALSE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form2, df1, contrasts=FALSE, sparse=TRUE)), nrow(df1))
    
    expect_equal(ncol(build.x(form2, df1, contrasts=FALSE, sparse=TRUE)), 1 + 1 + length(unique(df1$C)) + length(unique(df2$D)))
    
    # df2
    expect_is(build.x(form1, df2, contrasts=FALSE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form2, df2, contrasts=FALSE, sparse=TRUE)), nrow(df2))
    
    expect_equal(ncol(build.x(form2, df2, contrasts=FALSE, sparse=TRUE)), 1 + 1 + length(unique(df2$C)) + length(unique(df2$D)))
    
    # mat1
    expect_is(build.x(form1, mat1, contrasts=FALSE, sparse=TRUE), 'dgCMatrix')
    
    expect_equal(nrow(build.x(form1, mat1, contrasts=FALSE, sparse=TRUE)), nrow(mat1))
    
    expect_equal(ncol(build.x(form1, mat1, contrasts=FALSE, sparse=TRUE)), 1 + 1 + 1)
})