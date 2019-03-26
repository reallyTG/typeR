context("test-geom_asymmat")

test_that("x and y in data are organized properly", {
    df <- data.frame(x = c(1, 9, 2, 5),
                     y = c(2, 1, 3, 5),
                     other_values = c(1,2,3,4))
    good_params_tl <- list(which_triangle = "tl", other_param = "none")
    good_params_br <- list(which_triangle = "br", other_param = "none")
    bad_params <- list(which_triangle = "bad", other_param = "none")
    df_tl <- data.frame(x = c(1, 2),
                        y = c(2, 3),
                        other_values = c(1,3))
    df_br <- data.frame(x = c(9),
                        y = c(1),
                        other_values = c(2))

    expect_equal(organize_xy(df, good_params_tl), df_tl)
    expect_equal(organize_xy(df, good_params_br), df_br)
    expect_equal(organize_xy(df, bad_params), df)
    expect_equal(organize_xy(df, c()), df)
})


test_that("rect to poly works", {
    df <- data.frame(y = c(1, 1, 0, 0, 1),
                     x = c(0, 1, 1, 0, 0))
    expect_equal(dim(rect_to_poly(0, 1, 0, 1)), c(5, 2))
    expect_equal(rect_to_poly(0, 1, 0, 1), df)
})


test_that("geom_asymmat works", {
    tib <- data.frame(grp1 = c(rep("A", 3), rep("B", 3), rep("C", 3)),
                      grp2 = c(rep(c("A", "B", "C"), 3)),
                      val_1 = c(4, 3, 2, 1, NA, 1, 2, 3, 4),
                      val_2 = c(-4, -3, -2, -1, 0, 1, 2, 3, 4),
                      val_3 = c(1:9))
    g_asymmat <- ggplot(tib) +
        geom_asymmat(aes(x = grp1, y = grp2, fill_tl = val_1, fill_br = val_2))
    g_tile <- ggplot(tib) +
        geom_tile(aes(x = grp1, y = grp2, fill = val_1))

    expect_equal(class(g_asymmat), class(g_tile))
    expect_equal(length(g_asymmat$layers), 3)
    expect_true(all(c("fill_tl", "fill_br") %in% names(g_asymmat$labels)))
    expect_true(all(c("val_1", "val_2") %in% unlist(g_asymmat$labels)))

    expect_silent(ggplot_build(g_asymmat))
})

test_that("successfully check that data is properly formatted", {
    df <- data.frame(x = LETTERS[1:3],
                     y = LETTERS[1:3],
                     other_vals = c(1:3))
    expect_error(check_all_combinations(df))
    expect_true(check_all_combinations(asymmetrise(df, x, y)))
})
