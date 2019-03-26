context("Shannon entropy estimation value")

A0 <- factor(c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1))
A1 <- factor(c(0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1))
B0 <- factor(c(0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1))
B1 <- factor(c(0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1))
I  <- factor(c(0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1))
R  <- factor(c(0,0,0,0,1,0,0,1,1,0,1,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,1,1,1,1,1,0))
Y  <- factor(c(0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1))

test_that("entropy is equal to performed analysis", {
    expect_equal(H(A0), 1)
    expect_equal(H(Y), 0.988699408288497)
    expect_equal(H(I), 1)
    expect_equal(H(R), 0.988699408288497)
    expect_equal(H(A1), 1)
    expect_equal(H(B0), 1)
    expect_equal(H(B1), 1)
})

test_that("joint_H is equal to multivar_joint_H for two variables", {
    expect_equal(joint_H(A0, Y), multivar_joint_H(list(A0), Y))
    expect_equal(joint_H(A1, Y), multivar_joint_H(list(A1), Y))
    expect_equal(joint_H(B0, Y), multivar_joint_H(list(B0), Y))
    expect_equal(joint_H(B1, Y), multivar_joint_H(list(B1), Y))
})
