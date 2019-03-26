context("Tests of coordinate transformation function")

coord_data <- data.frame(
 loc_x = c(1, 3, 1, 3),
 loc_y = c(1, 1, 3, 3),
 abs_x = c(107.1, 107, 104.9, 105),
 abs_y = c(105.1, 107, 105.1, 106.9)
)

data_table <- data.frame(
 x = c(1.5, 1.2, 1.6, 2),
 y = c(1, 5, 2.1, 2),
 type = c("flint","flint","pottery","bone")
)

new_frame <- suppressMessages(
  cootrans(
    pair_matrix = coord_data,
    pm_column = c(1, 2, 3, 4),
    data_matrix = data_table,
    dm_column = c(1, 2),
    checkplot = FALSE
  )
)

wrong_data <- data.frame(
  loc_x = c(1, 3, 1, 3),
  loc_y = c(1, 3, 3, 1),
  abs_x = c(107.1, 107, 104.9, 105),
  abs_y = c(105.1, 107, 105.1, 106.9)
)

check_data <- suppressMessages(
  cootrans(
    pair_matrix = wrong_data,
    pm_column = c(1, 2, 3, 4),
    data_matrix = data_table,
    dm_column = c(1, 2),
    checking = TRUE,
    checkplot = FALSE
  )
)
#####
#####

test_that(
  "the output of the transformation function is a
  data.frame", {
    expect_true(
      is.data.frame(new_frame)
    )
  }
)

test_that(
  "the output data.frame of the transformation function
  has the correct colnames", {
    expect_equal(
      colnames(new_frame),
      c("x", "y", "type", "abs_x", "abs_y")
    )
  }
)

test_that(
  "the input data.frames have minimum number of columns", {
    expect_gte(length(colnames(coord_data)), 4)
    expect_gte(length(colnames(data_table)), 2)
  }
)

test_that(
  "the output data.frame has two additional columns", {
    expect_equal(
      length(colnames(new_frame)),
      length(colnames(data_table))+2
    )
  }
)

test_that(
  "wrong assignement of coordinates returns a warning
  message", {
    expect_warning(
      cootrans(wrong_data, c(1, 2, 3, 4), data_table, c(1, 2),
               checkplot = FALSE)
    )
  }
)

test_that(
  "with testing=TRUE resulting check_data data.frame is the
  original data.frame with two additional columns", {
    expect_identical(
      wrong_data,
      check_data[,1:(length(colnames(check_data))-2)]
    )
  }
)

test_that(
  "with testing=TRUE output data.frame has the correct
  colnames", {
    expect_equal(
      colnames(check_data),
      c("loc_x", "loc_y", "abs_x", "abs_y",
        "scalation", "rotation")
    )
  }
)

test_that(
  "transformation runs correctly. And even with points
  corresponding with the centroids (previous scale-NaN Bug)", {
    simple_coord <- data.frame(
      loc_x = c(1, 3, 1, 3, 2),
      loc_y = c(1, 1, 3, 3, 2),
      abs_x = c(7, 7, 5, 5, 6),
      abs_y = c(5, 7, 5, 7, 6)
    )
    test_data <- data.frame(
      index = c(1, 2, 3, 4),
      x = c(3, 6, 4, 2),
      y = c(2, 1, 4, 2)
    )
    # the expected results where calculated using the
    # original python-script
    exp_frame <- data.frame(
      test_data,
      abs_x = c(6, 7, 4, 6),
      abs_y = c(7, 10, 8, 6)
    )
    exp_check <- data.frame(
      simple_coord,
      scalation = c(1, 1, 1, 1, NaN),
      rotation = c(270, 270, 270, 270, NaN)
    )

    expect_equal(
      cootrans(simple_coord, c(1,2,3,4), test_data, c(2,3),
               checkplot = FALSE),
      exp_frame
    )

    expect_equal(
      cootrans(simple_coord, c(1,2,3,4), test_data, c(2,3),
               checking = TRUE, checkplot = FALSE),
      exp_check
    )
  }
)

test_that(
  "transformation runs correctly. One points corresponding
  with the centroid (!div0 problem)", {
    simple_coord <- data.frame(
      loc_x = c(1, 3, 1, 3, 2),
      loc_y = c(1, 1, 3, 3, 2),
      abs_x = c(7, 7, 5, 5, 6.1),
      abs_y = c(5, 7, 5, 7, 6.1)
    )
    test_data <- data.frame(
      index = c(1, 2, 3, 4),
      x = c(3, 6, 4, 2),
      y = c(2, 1, 4, 2)
    )
    # the expected results where calculated using the
    # original python-script
    exp_frame <- data.frame(
      test_data,
      abs_x = c(6.02, 7.020099990001998, 4.019800019996, 6.02),
      abs_y = c(7.020099990001999, 10.020399960007996, 8.020199980003998, 6.02)
    )
    exp_check <- data.frame(
      simple_coord,
      scalation = c(1.000199980003999, 0.9800000000000004, 1.0199999999999994, 1.000199980003999, Inf),
      rotation = c(271.1457628381751, 270.0, 270.0, 268.85423716182487, NaN)
    )

    expect_equal(
      cootrans(simple_coord, c(1,2,3,4), test_data, c(2,3),
               checkplot = FALSE),
      exp_frame
    )

    expect_equal(
      cootrans(simple_coord, c(1,2,3,4), test_data, c(2,3),
               checking = TRUE, checkplot = FALSE),
      exp_check
    )
  }
)