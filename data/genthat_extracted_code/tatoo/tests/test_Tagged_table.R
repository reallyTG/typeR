context("Tagged_table")

#* @testing tagged_table
#* @testing tag_table

test_that("Tagged_table constructors work", {
  source(file.path(test_path(), 'testdata', 'testdata.R'))

  # Generating tagged table explicitley
  expect_silent(tmeta <- tag_table(
    t_df1, meta = t_meta_verbose))

  expect_identical(
    class(tmeta),
    c("Tagged_table", "Tatoo_table", "data.table", "data.frame")
  )


  # Tagged table can also be created directly when creating another Tatoo table
  # by supplying the optional meta argument
  expect_silent(tres <- mash_table(
    t_df1, t_df1, meta = t_meta_simple)
  )
  expect_identical(
    class(tres),
    c("Tagged_table", "Mashed_table", "Tatoo_table", "list")
  )

  expect_silent(tres <- comp_table(
    t_df1, t_df2, meta = t_meta_simple)
  )
  expect_identical(
    class(tres),
    c("Tagged_table", "Composite_table", "Tatoo_table", "data.table", "data.frame")
  )

  expect_silent(tres <- stack_table(
    t_df1, t_df2, meta = t_meta_simple)
  )
  expect_identical(
    class(tres),
    c("Tagged_table", "Stacked_table", "Tatoo_table", "list")
  )
})






test_that("metadata replacement functions work", {
  tdat <- data.frame(
    x = letters[1:5],
    y = letters[10:14]
  )

  tres <- assign_tt_meta(
    tdat,
    list(longtitle = 'blubb')
  )

  expect_identical(
    class(tres),
    c("Tagged_table", 'Tatoo_table', "data.table", "data.frame")
  )

  expect_identical(
    attr(tres, 'meta')$longtitle, 'blubb'
  )

  table_id(tres) <- 'T01'
  title(tres) <- 'Table 01'
  longtitle(tres) <- 'The first table'
  subtitle(tres) <- c(
    'Another awkward subtitle for a table',
    'that can span multiple lines'
  )
  footer(tres) <- c(
    'a footer can also',
    'span multiple lines'
  )

  expect_identical(
    class(tres),
    c("Tagged_table", 'Tatoo_table', "data.table", "data.frame")
  )

  expected_meta <- tt_meta(
    table_id = "T01",
    title = "Table 01",
    longtitle = "The first table",
    subtitle = c(
      "Another awkward subtitle for a table",
      "that can span multiple lines"),
    footer = c(
      "a footer can also",
      "span multiple lines")
  )

  expect_identical(
    attr(tres, 'meta'),
    expected_meta
  )

  title(tres) <- NULL
  meta(tres) <- NULL

  expect_identical(
    class(tres),
    c('Tatoo_table', 'data.table', 'data.frame')
  )
})




test_that("make_tag_table_print_title works as expected", {

  tres1  <- make_tag_table_print_title(t_meta_simple)
  tres1b <- make_tag_table_print_title(t_meta_verbose, show_subtitle = FALSE)
  tres2  <- make_tag_table_print_title(t_meta_verbose)
  tres3  <- make_tag_table_print_title(t_meta_sub)

  expect_identical(
    tres1,
    c("tid: title - longitle", "subtitle")
  )

  expect_identical(
    tres1b,
    c(
      "rp1: stack table 1 - stack table 1 is a stack of tables",
      "with a very long title",
      "that spans several rows"
    )
  )

  expect_identical(
    tres2,
    c(
      "rp1: stack table 1 - stack table 1 is a stack of tables",
      "with a very long title",
      "that spans several rows",
      "with a subtitle"
    )
  )

  expect_identical(
    tres3,
    t_meta_sub$subtitle
  )
})
