context("fill_nth_LaTeX_argument")

test_that("Known results", {
  y1 <- c("Some \\textcites{fooz}{cla2}[a]{a}{c} text.", "Other \\textcites{B}{C}")
  fill_1 <- fill_nth_LaTeX_argument(parsed_doc = parse_tex(y1), "textcites", n = 1L)
  expect_identical(fill_1,
                   c("Some \\textcites{    }{cla2}[a]{a}{c} text.", "Other \\textcites{ }{C}"))
  fill_2 <- fill_nth_LaTeX_argument(parsed_doc = parse_tex(y1), "textcites", n = 2L)
  expect_identical(fill_2, 
                   c("Some \\textcites{fooz}{    }[a]{a}{c} text.", "Other \\textcites{B}{ }"))
  fill_3 <- fill_nth_LaTeX_argument(parsed_doc = parse_tex(y1), "textcites", n = 3L)
  expect_identical(fill_3, 
                   c("Some \\textcites{fooz}{cla2}[a]{ }{c} text.", "Other \\textcites{B}{C}"))
  
  fill_all <- fill_nth_LaTeX_argument(parsed_doc = parse_tex(y1), "textcites", n = NA)
  expect_identical(fill_all,
                   c("Some \\textcites{    }{    }[a]{ }{ } text.", "Other \\textcites{ }{ }"))
  
})
