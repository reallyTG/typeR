context("Permutation")

test_that("Permutation", {
    I <- iterpc(5, ordered = TRUE)
    expect_that(getnext(I)[3], equals(3))
    expect_that(getcurrent(I)[3], equals(3))
    expect_that(nrow(getall(I)), equals(120))

    I <- iterpc(3, labels = c("a", "b", "c"), ordered = TRUE)
    getnext(I)
    expect_that(getnext(I), equals(c("a", "c", "b")))
    expect_that(getcurrent(I), equals(c("a", "c", "b")))

    I <- iterpc(c(2, 1), labels = c("a", "c"), ordered = TRUE)
    expect_that(nrow(getall(I)), equals(3))

    I <- iterpc(c(2, 2), 2, labels = c("a", "c"), ordered = TRUE)
    expect_that(nrow(getall(I)), equals(4))
    getnext(I)
    expect_that(getnext(I)[2], equals("c"))

    I <- iterpc(c(2, 2, 0), 2, labels = c("a", "b", "c"), ordered = TRUE)
    expect_that(nrow(getall(I)), equals(4))

    I <- iterpc(c(2, 2), 2, labels = c("a", "c"), replace = TRUE, ordered = TRUE)
    expect_that(nrow(getall(I)), equals(4))
    expect_that(getnext(I, 2)[2, 2], equals("c"))

    I <- iterpc(5, 1, ordered = TRUE)
    expect_that(nrow(getall(I)), equals(5))

    I <- iterpc(5, 1, labels = 1:5, ordered = TRUE)
    expect_that(nrow(getall(I)), equals(5))

    I <- iterpc(5, 2, labels = 1:5, ordered = TRUE)
    expect_that(nrow(getall(I)), equals(20))

    I <- iterpc(5, 1, labels = 1:5)
    expect_that(nrow(getall(I)), equals(5))

    I <- iterpc(1, 1)
    expect_that(nrow(getall(I)), equals(1))
    getnext(I)
    expect_that(getnext(I), equals(NULL))
})
