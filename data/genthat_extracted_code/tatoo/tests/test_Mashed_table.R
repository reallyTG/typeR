context('Mashed_table')

#* @testing mashed_table
#* @testing mash_table

test_that('mash_table: stacking tables by row works', {
  source(file.path(test_path(), 'testdata', 'testdata.R'))

  #* @testing mash_table
  #* @testing mash_rows
  #* @testing as.data.table.Mashed_table
  #* @testing as.data.frame.Mashed_table

  # Creating mash tables works for two elements (legacy version of the function
  # only accepted two arguments)
    expect_error(mash_table(t_df1, t_df2))
    expect_silent(st1 <- mash_table(t_df1, t_df2, rem_ext = '_xt'))
    expect_silent(st2 <- mash_table(t_df1, t_df3, rem_ext = '_xt'))

  # but also for an arbitrary number
    expect_error(mash_table(t_df1, t_df2, t_df1, t_df2))
    expect_silent(st3 <- mash_table(t_df1, t_df2, t_df1, t_df2, rem_ext = '_xt'))
    expect_silent(st4 <- mash_table(t_df1, t_df3, t_df1, t_df2, rem_ext = '_xt'))

  # Testing if row mashing works
    ## Input must be a mash_table
      expect_error(mash_rows(t_df1))

    ## for two data.frames
      expect_silent(res1 <- mash_rows(st1))
      expect_identical(nrow(res1), sum(unlist(lapply(st1, nrow))))

    ## for an arbitrary number of data.frames
      expect_silent(res3 <- mash_rows(st3))
      expect_identical(nrow(res3), sum(unlist(lapply(st3, nrow))))

    ## Ensure classes were preserved
      expect_identical(lapply(res1, class), lapply(t_df1, class))

    ## For better visual differentiation, blank rows can be inserted between
    ## mashes (useful especially for latex or xlsx export)
      expect_silent(res1 <- as.data.table(st1, insert_blank_row = TRUE))

      sel <- seq(3, nrow(res1), 3)
      expect_true(all(rowSums(res1[sel] == '') == ncol(res1)))
      expect_false(any(rowSums(res1[-sel] == '') == ncol(res1)))
})


test_that('mash_table: stacking tables by col works', {
  #* @testing mash_cols
  #* @testing as.data.table.Mashed_table

  source(file.path(test_path(), 'testdata', 'testdata.R'))

  # Creating stack tables
  expect_silent(st1 <- mash_table(t_df1, t_df2, rem_ext = '_xt'))
  expect_silent(st2 <- mash_table(t_df1, t_df3, rem_ext = '_xt'))
  expect_silent(st3 <- mash_table(t_df1, t_df2, t_df1, t_df2, rem_ext = '_xt'))

  # Create col stacked data.table
  expect_error(mash_cols(t_df1))
  expect_error(mash_cols(st1, suffixes = c('.x', '.y', '.z')))
  expect_silent(res1 <- mash_cols(st1))

  # Create col stacked data.table (with id_vars)
  st1[[1]]$id_1 <- LETTERS[1:5]
  st1[[2]]$id_1 <- LETTERS[1:5]
  st1[[1]]$id_2 <- letters[6:10]
  st1[[2]]$id_2 <- letters[6:10]

  expect_silent(res1 <- mash_cols(
    st1, id_vars = c('id_1', 'id_2')
  ))
  expect_silent(res2 <- mash_cols(
    st1,
    id_vars = c('id_1', 'id_2'),
    suffixes = c('foo', 'bar')
  ))
  expect_silent(res3 <- mash_cols(st1))
  expect_silent(res4 <- mash_cols(
    st1,
    suffixes = c('x', 'y')
  ))


  expect_identical(unlist(
    lapply(res1, class), use.names = FALSE),
    c("character", "character", "numeric", "numeric", "character",
      "character", "factor", "factor", "integer", "integer")
  )

  expect_identical(
    names(res2),
    c("id_1", "id_2", "numbers.foo", "numbers.bar", "animals.foo", "animals.bar",
      "factors.foo", "factors.bar", "ints.foo", "ints.bar")
  )

  expect_identical(
    names(res3),
    c("numbers", "numbers", "animals", "animals", "factors", "factors",
      "ints", "ints", "id_1", "id_1", "id_2", "id_2")
  )

  expect_identical(
    names(res4),
    c("numbers.x", "numbers.y", "animals.x", "animals.y", "factors.x",
      "factors.y", "ints.x", "ints.y", "id_1.x", "id_1.y", "id_2.x",
      "id_2.y")
  )

  # test for an arbitrary number of columns
  st3id <- lapply(st3, function(x) {
    x$id  <- seq_len(nrow(x))
    x$id2 <- LETTERS[x$id]
    return(x)
  }) %>% mash_table_list()

  expect_silent(mash_cols(st3id))
  expect_silent(mash_cols(st3id, id_vars = c('id', 'id2')))
})



test_that('mash_table: as.data.table and setters work', {
  #* @testing as.data.table.Mashed_table
  #* @testing as.data.frame.Mashed_table

  source(file.path(test_path(), 'testdata', 'testdata.R'))

  expect_silent(st1 <- mash_table(t_df1, t_df2, rem_ext = '_xt'))
  st1[[1]]$id_1 <- LETTERS[1:5]
  st1[[2]]$id_1 <- LETTERS[1:5]
  st1[[1]]$id_2 <- letters[6:10]
  st1[[2]]$id_2 <- letters[6:10]

  # See if as.data.table outputs the correct number of rows
    expect_identical(
      nrow(as.data.table(st1)),
      10L
    )

    expect_identical(
      length(utils::capture.output(print(st1))),
      11L
    )


  # Default parameters can be overwritten in as.data.table or modifed via set
    tres1 <- as.data.table(st1, insert_blank_row = TRUE)

    expect_identical(
      nrow(tres1),
      14L
    )

    insert_blank_row(st1) <- TRUE

    expect_identical(
      as.data.table(st1),
      tres1
    )

    expect_identical(
      length(utils::capture.output(print(st1))),
      15L
    )

  # Set stack method
    mash_method(st1) <- 'col'
    expect_identical(
      nrow(as.data.table(st1)),
      5L
    )

  # set by
    id_vars(st1) <- c('id_1', 'id_2')

    expect_identical(
      nrow(as.data.table(st1)),
      5L
    )

    expect_identical(
      length(utils::capture.output(print(st1))),
      6L
    )

    expect_identical(
      as.data.frame(st1),
      as.data.frame(as.data.table(st1))
    )

    expect_identical(
      as.data.table(as.data.frame(st1)),
      as.data.table(st1)
    )
})


test_that('rmash and cmash behave as expected', {
  expect_silent(st1 <- mash_table(t_df1, t_df2, rem_ext = '_xt'))
  st1[[1]]$id_1 <- LETTERS[1:5]
  st1[[2]]$id_1 <- LETTERS[1:5]
  st1[[1]]$id_2 <- letters[6:10]
  st1[[2]]$id_2 <- letters[6:10]

  expect_silent(tres1 <- rmash(st1))
  expect_silent(tres2 <- rmash(
    t_df1,
    t_df2,
    rem_ext = '_xt',
    insert_blank_row = TRUE
  ))

  # Check output for correct number of rows
    expect_identical(nrow(tres1), 10L)
    expect_identical(nrow(tres2), 14L)

  # If dat is a Tatoo_table or data.table, return a data.table, else return
  # a plain data.frame
    expect_identical(class(tres1), c('data.table', 'data.frame'))
    expect_identical(class(tres2), c('data.frame'))


    expect_silent(tres3 <- cmash(st1))
    expect_silent(tres4 <- cmash(
      st1[[1]],
      st1[[2]],
      id_vars = c('id_1', 'id_2')
    ))

    expect_identical(
      ncol(tres3),
      sum(sapply(st1, ncol))
    )

    expect_identical(
      ncol(tres4),
      sum(sapply(st1, ncol)) - 2L
    )
})




test_that('mash table print method produces output', {
  st1 <- mash_table(
    mean = t_df1,
    sd = t_df2,
    rem_ext = '_xt',
    mash_method = 'col'
  )

  st2 <- mash_table(
    mean = t_df1,
    sd = t_df1,
    rem_ext = '_xt',
    mash_method = 'col',
    id_vars = 'numbers'
  )

  st3 <- mash_table(
    mean = t_df1,
    sd = t_df1,
    blubb = t_df1,
    rem_ext = '_xt',
    mash_method = 'col',
    id_vars = 'numbers'
  )

  st4 <- mash_table(
    mean = t_df1,
    sd = t_df1,
    blubb = t_df1,
    rem_ext = '_xt',
    mash_method = 'col',
    id_vars = c('numbers', 'animals')
  )

  expect_output(print(st1))
  expect_output(print(st2))
  expect_output(print(st3))
  expect_output(print(st4))
})

