context("crosstab")

test_that("different sizes and shapes of data", {
    expect_equal( crosstab(rep(letters[1:3], 4), rep(1:4, each=3)), 
                structure(list(X1 = c(1, 1, 1), X2 = c(1, 1, 1), X3 = c(1, 1, 1), X4 = c(1, 1, 1)), 
                .Names = c("X1", "X2", "X3", "X4"), row.names = c("a", "b", "c"), class = "data.frame") )

    expect_equal( crosstab(rep(letters[1:3], 4), rep(1:4, each=3), allrows=letters[1:5]), 
                structure(list(X1 = c(1, 1, 1, 0, 0), X2 = c(1, 1, 1, 0, 0), X3 = c(1, 1, 1, 0, 0), 
                X4 = c(1, 1, 1, 0, 0)), .Names = c("X1", "X2", "X3", "X4"), 
                row.names = c("a", "b", "c", "d", "e"), class = "data.frame") )

    expect_equal( crosstab(rep(letters[1:3], 4), rep(1:4, each=3), allrows=letters[1:5], allcols=1:5), 
                structure(list(X1 = c(1, 1, 1, 0, 0), X2 = c(1, 1, 1, 0, 0), X3 = c(1, 1, 1, 0, 0), 
                X4 = c(1, 1, 1, 0, 0), X5 = c(0, 0, 0, 0, 0)), .Names = c("X1", "X2", "X3", "X4", "X5"), 
                row.names = c("a", "b", "c", "d", "e"), class = "data.frame") )

    expect_equal( crosstab(rep(letters[1], 12), rep(1:4, each=3), allrows=letters[1:5], allcols=1:5), 
                structure(list(X1 = c(3, 0, 0, 0, 0), X2 = c(3, 0, 0, 0, 0), X3 = c(3, 0, 0, 0, 0), 
                X4 = c(3, 0, 0, 0, 0), X5 = c(0, 0, 0, 0, 0)), .Names = c("X1", "X2", "X3", "X4", "X5"),
                row.names = c("a", "b", "c", "d", "e"), class = "data.frame") )

    expect_equal( crosstab(rep(letters[1], 12), rep(1:4, each=3), allcols=1:5), 
                 structure(list(X1 = 3, X2 = 3, X3 = 3, X4 = 3, X5 = 0), 
                 .Names = c("X1", "X2", "X3", "X4", "X5"), row.names = "a", class = "data.frame") )

    expect_equal( crosstab(rep(letters[1:3], 4), rep(1, each=12), allrows=letters[1:5], allcols=1:5), 
                 structure(list(X1 = c(4, 4, 4, 0, 0), X2 = c(0, 0, 0, 0, 0), X3 = c(0, 0, 0, 0, 0), 
                 X4 = c(0, 0, 0, 0, 0), X5 = c(0, 0,  0, 0, 0)), 
                .Names = c("X1", "X2", "X3", "X4", "X5"), row.names = c("a", "b", "c", "d", "e"), class = "data.frame") )

    expect_equal( crosstab(rep(letters[1:3], 4), rep(1, each=12), allrows=letters[1:5]), 
                 structure(list(X1 = c(4, 4, 4, 0, 0)), .Names = "X1", 
                 row.names = c("a", "b", "c", "d", "e"), class = "data.frame") )

    expect_equal( crosstab(rep(1, each=12), rep(letters[1:3], 4), allcols=letters[1:5]), 
                structure(list(a = 4, b = 4, c = 4, d = 0, e = 0), 
                .Names = c("a", "b", "c", "d", "e"), row.names = "1", class = "data.frame") )

    expect_equal( crosstab(rep(letters[1:3], 4), rep(1, each=12), allcols=1:5), 
                structure(list(X1 = c(4, 4, 4), X2 = c(0, 0, 0), X3 = c(0, 0, 0), X4 = c(0, 0, 0), 
                X5 = c(0, 0, 0)), .Names = c("X1", "X2", "X3", "X4", "X5"), 
                row.names = c("a", "b", "c"), class = "data.frame") )

})


test_that("data interface", {
    x <- data.frame(a = rep(letters[1:3], 4), b = rep(1:4, each=3), c = seq_len(12))
    
    expect_equal( crosstab(a, b, data=x), 
                structure(list(X1 = c(1, 1, 1), X2 = c(1, 1, 1), X3 = c(1, 1, 1), 
                X4 = c(1, 1, 1)), .Names = c("X1", "X2", "X3", "X4"), 
                row.names = c("a", "b", "c"), class = "data.frame") )

})


test_that("function options", {
    x <- data.frame(a = rep(letters[1:3], 8), b = rep(1:4, each=6), c = rep(1:12, times=2))

    expect_equal( crosstab(a, b, c, data=x, type="sum"), 
                structure(list(X1 = c(5, 7, 9), X2 = c(17, 19, 21), X3 = c(5, 7, 9), 
                X4 = c(17, 19, 21)), .Names = c("X1", "X2", "X3", "X4"), 
                row.names = c("a", "b", "c"), class = "data.frame") )

    expect_equal( crosstab(a, b, c, data=x, type="min"), 
                structure(list(X1 = c(1, 2, 3), X2 = c(7, 8, 9), X3 = c(1, 2, 3), 
                X4 = c(7, 8, 9)), .Names = c("X1", "X2", "X3", "X4"), 
                row.names = c("a", "b", "c"), class = "data.frame") )

    expect_equal( crosstab(a, b, c, data=x, type="max"), 
                structure(list(X1 = c(4, 5, 6), X2 = c(10, 11, 12), X3 = c(4, 5, 6), 
                X4 = c(10, 11, 12)), .Names = c("X1", "X2", "X3", "X4"), 
                row.names = c("a", "b", "c"), class = "data.frame") )

    expect_equal( crosstab(a, b, c, data=x, type="mean"), 
                structure(list(X1 = c(2.5, 3.5, 4.5), X2 = c(8.5, 9.5, 10.5), X3 = c(2.5, 3.5, 4.5), 
                X4 = c(8.5, 9.5, 10.5)), .Names = c("X1", "X2", "X3", "X4"), 
                row.names = c("a", "b", "c"), class = "data.frame") )

    expect_equal( crosstab(a, b, c, data=x, type="count"), 
                structure(list(X1 = c(2, 2, 2), X2 = c(2, 2, 2), X3 = c(2, 2, 2), 
                X4 = c(2, 2, 2)), .Names = c("X1", "X2", "X3", "X4"), 
                row.names = c("a", "b", "c"), class = "data.frame") )

})


