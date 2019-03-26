context("test-asymmetrise")

test_that("create a single fill data frame", {
    expect_error(make_fill_df(data.frame(), 2),
                 regexp = "df must have at least 1 column")
    expect_error(make_fill_df(data.frame(x = 1), 0),
                 regexp = "must request at least one row")
    df <- data.frame(x = 1:10, y = LETTERS[1:10])
    expect_equal(make_fill_df(df),
                 data.frame(x = NA, y = NA))
    expect_equal(make_fill_df(df, 5),
                 data.frame(x = rep(NA, 5), y = rep(NA, 5)))
    expect_equal(make_fill_df(df, 5, "Z"),
                 data.frame(x = c("Z", "Z", "Z", "Z", "Z"),
                            y = c("Z", "Z", "Z", "Z", "Z"),
                            stringsAsFactors = FALSE))
})


test_that("factor levels are handeled correctly", {
    fa <- factor(c("J", "O", "S", "H"), levels = LETTERS)
    fb <- factor(c("C", "O", "O", "K"), levels = LETTERS)
    fc <- factor(LETTERS[1:4])
    fd <- factor(LETTERS[2:6])
    char1 <- LETTERS[1:5]
    char2 <- LETTERS[10:20]
    expect_equal(organize_levels(fa, fb), LETTERS)
    expect_null(organize_levels(c(), c()))
    expect_null(organize_levels(char1, char2))
    expect_equal(organize_levels(fc, fd), LETTERS[1:6])
})


test_that("all other combinations are made", {
    a <- c("A", "B")
    b <- c("A", "B")
    df <- data.frame(Var1 = c("B", "A"), Var2 = c("A", "B"),
                     stringsAsFactors = FALSE)
    expect_true(nrow(get_other_combs(a,b)) == 2)
    expect_true(all(colnames(get_other_combs(a,b)) == c("Var1", "Var2")))
    expect_equal(get_other_combs(a,b), df)

    a <- c(1, 2)
    b <- c(1, 2)
    df <- data.frame(Var1 = c(2, 1), Var2 = c(1, 2))
    expect_true(nrow(get_other_combs(a,b)) == 2)
    expect_true(all(colnames(get_other_combs(a,b)) == c("Var1", "Var2")))
    expect_equal(get_other_combs(a,b), df)

    a <- c(1, "A")
    b <- c(1, "A")
    df <- data.frame(Var1 = c("A", "1"), Var2 = c("1", "A"),
                     stringsAsFactors = FALSE)
    expect_true(nrow(get_other_combs(a,b)) == 2)
    expect_true(all(colnames(get_other_combs(a,b)) == c("Var1", "Var2")))
    expect_equal(get_other_combs(a,b), df)
})


test_that("properly determine if a df is grouped", {
    library(tibble)
    tib <- tibble(a = c(1,1,1,2,2,2))
    expect_false(is_grouped(tib))
    expect_true(is_grouped(dplyr::group_by(tib, a)))

    tib <- data.frame(a = c(1,1,1,2,2,2))
    expect_false(is_grouped(tib))
    expect_true(is_grouped(dplyr::group_by(tib, a)))
})


test_that("adding all combinations", {
    complete_df <- data.frame(x = c("A", "A", "B", "B"),
                              y = c("A", "B", "A", "B"))
    partial_df_1 <- data.frame(x = c("A", "B"),
                               y = c("A", "B"),
                               val = c(1, 2))
    partial_df_2 <- data.frame(x = c("A", "B", "B", "A"),
                               y = c("A", "B", "A", "B"),
                               val = c(1, 2, NA, NA))
    expect_equal(add_missing_combinations(complete_df, x, y), complete_df)
    expect_equal(add_missing_combinations(partial_df_1, x, y), partial_df_2)

    df <- data.frame(a = c("A", "B"),
                     b = c("B", "A"),
                     grps = c(1, 2),
                     stringsAsFactors = FALSE)
    df <- dplyr::group_by(df, grps)
    expect_equal(dim(add_missing_combinations(df, a, b)), c(8, 3))
    expect_equal(add_missing_combinations(df, a, b)$grps, c(1,1,1,1,2,2,2,2))
    expect_false(is.null(dplyr::groups(add_missing_combinations(df, a, b))))
})


test_that("additional columns are added", {
    complete_df <- data.frame(x = c("A", "A", "B", "B"),
                              y = c("A", "B", "A", "B"),
                              stringsAsFactors = FALSE)
    expect_equal(bind_missing_combs(complete_df, x, y), complete_df)
    partial_df_1 <- data.frame(x = c("A", "B"),
                               y = c("A", "B"),
                               val = c(1, 2),
                               stringsAsFactors = FALSE)
    partial_df_2 <- data.frame(x = c("A", "B", "B", "A"),
                               y = c("A", "B", "A", "B"),
                               val = c(1, 2, NA, NA),
                               stringsAsFactors = FALSE)
    expect_equal(bind_missing_combs(partial_df_1, x, y), partial_df_2)
})


test_that("columns are swapped",  {
    df <- data.frame(x = c(LETTERS[1:4]),
                     y = c(letters[10:13]),
                     val = c(1, 2, NA, NA),
                     grp = c(1, 1, 2, 2))
    grouped_df <- dplyr::group_by(df, grp)
    df_swapped <- data.frame(x = c(letters[10:13]),
                             y = c(LETTERS[1:4]),
                             val = c(1, 2, NA, NA),
                             grp = c(1, 1, 2, 2))
    expect_equal(swap_cols(df, x, y), df_swapped)
    expect_equal(swap_cols(grouped_df, x, y),
                 dplyr::group_by(df_swapped, grp))
})


test_that("data frame is asymmeterized", {
    df_factors <- data.frame(a = c("A", "B"),
                             b = c("C", "D"))
    df_char <- data.frame(a = c("A", "B"),
                          b = c("C", "D"),
                          stringsAsFactors = FALSE)
    a_df <- data.frame(a = c("A", "B", "C", "D", "A", "B", "D", "A", "B", "C",
                             "B", "C", "D", "A", "C", "D"),
                       b = c("C", "D", "A", "B", "A", "A", "A", "B", "B", "B",
                             "C", "C", "C", "D", "D", "D"),
                       stringsAsFactors = FALSE)
    expect_equal(asymmetrise(df_factors, a, b), a_df)
    expect_equal(asymmetrize(df_factors, a, b), a_df)

    expect_equal(asymmetrise(df_char, a, b), a_df)
    expect_equal(asymmetrize(df_char, a, b), a_df)

    df_factors_grp <- rbind(df_factors, df_factors)
    df_factors_grp$grps <- c(1,1,2,2)
    df_factors_grp <- dplyr::group_by(df_factors_grp, grps)
    b_df <- rbind(a_df, a_df)
    b_df$grps <- c(rep(1, nrow(a_df)), rep(2, nrow(a_df)))

    expect_false(is.null(dplyr::groups(asymmetrise(df_factors_grp, a, b))))
    expect_false(is.null(dplyr::groups(asymmetrize(df_factors_grp, a, b))))

    expect_equal(asymmetrise(df_factors_grp, a, b), dplyr::group_by(b_df, grps))
    expect_equal(asymmetrize(df_factors_grp, a, b), dplyr::group_by(b_df, grps))
})


# TESTS TO ADD:
#  asymmetrise/ze obeys groups
#  `get_other_combs`
