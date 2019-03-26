context("decision-logic")

test_that("utility functions work", {

  expect_match(get_con_description(stdout()), "stdout")

  expect_false(is_interactive())

  expect_false(is_in_knitr())
})

test_that("logfile choices work",
  with_mock(
    get_chunk_label = function() "knitrchunk",
    is_in_knitr = function() TRUE,
    get_con_description = function(con){
      class(con) <- "connection"
      con_desc <- unlist(summary.connection(con))["description"]
      close.connection(con)
      file.remove(con_desc)
      con_desc
    },

    all_options <- list(kpb.log_file = "testing_1.log"),
    expect_match(get_con_description(set_logfile(all_options)), "testing_1.log"),

    all_options <- list(kpb.log_pattern = "hi"),
    expect_match(get_con_description(set_logfile(all_options)), "hiknitrchunk.log"),

    all_options <- list(),
    {
      expect_match(get_con_description(set_logfile(all_options)), "kpb_output.log")
    }


  )
)


test_that("basic decisions work",
  {with_mock(
    is_interactive = function() TRUE,

    is_in_knitr = function() TRUE,
    expect_match(get_con_description(make_kpb_output_decisions()), "stderr")
  )

  with_mock(
    is_interactive = function() TRUE,
    is_in_knitr = function() FALSE,
    expect_match(get_con_description(make_kpb_output_decisions()), "stdout")
  )

  with_mock(
    is_interactive = function() FALSE,
    is_in_knitr = function() TRUE,
    expect_match(get_con_description(make_kpb_output_decisions()), "stderr")
  )

  with_mock(
    is_interactive = function() FALSE,
    is_in_knitr = function() FALSE,
    expect_match(get_con_description(make_kpb_output_decisions()), "stdout")
  )

  with_mock(
    is_interactive = function() FALSE,
    is_in_knitr = function() FALSE,
    withr::with_options(list(kpb.suppress_noninteractive = TRUE),
                 expect_null(make_kpb_output_decisions()))
  )

  with_mock(
    is_interactive = function() FALSE,
    is_in_knitr = function() TRUE,
    withr::with_options(list(kpb.suppress_noninteractive = TRUE),
                        expect_null(make_kpb_output_decisions()))
  )
  }

)
#
test_that("logfile options work",
  {
    with_mock(
      is_interactive = function() TRUE,
      is_in_knitr = function() FALSE,
      withr::with_options(list(kpb.use_logfile = TRUE),
                          {
                            withr::with_output_sink("logfile_message.txt",
                                                   make_kpb_output_decisions())
                          expect_match(paste(scan("logfile_message.txt", sep = "", what = character(), blank.lines.skip = FALSE), collapse = " "),  " Progress is being logged in: kpb_output.log")
                            }
    ))
    file.remove("logfile_message.txt")
    file.remove("kpb_output.log")
    }
  )