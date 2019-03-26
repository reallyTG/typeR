context("Information gain estimation value")

x1 <- factor(c(0,0,1,1))
x2 <- factor(c(0,1,0,1))
y  <- factor(c(0,1,1,0))

test_that("IG is equal to its equivalent expression", {
    expect_equal(IG(x1, y), H(x1) + H(y) - joint_H(x1, y))
    expect_equal(IG(x2, y), H(x2) + H(y) - joint_H(x2, y))
    expect_equal(IG(x1, x2), H(x1) + H(x2) - joint_H(x1, x2))
})
