context("Unclosed parentheses")

test_that("Closed parentheses NULL", {
  expect_null(check_unclosed_parentheses(tex_lines = "This (should) work."))
})

test_that("Unclosed parentheses error", {
  expect_error(check_unclosed_parentheses(tex_lines = "(This should error"), 
               regexp = "parenthesis that does not close")
})

test_that("Unopened parenthesis", {
  
  # options("TeXCheckR.halt_on_error" = FALSE)
  # the_msg <- 
  #   capture.output(check_unclosed_parentheses(tex_lines = "This parenthesis) should have been opened"))
  # 
  # expect_true(any(grepl("Unexpected closing parenthesis.",
  #                       the_msg, 
  #                       fixed = TRUE)),
  #             info = the_msg)
  # 
  options("TeXCheckR.halt_on_error" = TRUE)
  expect_error(check_unclosed_parentheses(tex_lines = "This parenthesis) should have been opened"),
               regexp = "Unexpected closing parenthesis.")
  
  expect_null(check_unclosed_parentheses(tex_lines = "This is ok a) foo b) bar c) baz."))
  expect_null(check_unclosed_parentheses(tex_lines = "This is ok a) foo b) bar 1) baz. 2) foobaz"))
  expect_null(check_unclosed_parentheses(tex_lines = "This is ok A) foo B) bar 1) baz. 2) foobaz"))
  expect_error(check_unclosed_parentheses(tex_lines = "This is ok a) foo b) bar 1) baz. B) foobaz"))
  expect_error(check_unclosed_parentheses(tex_lines = "This is ok a) foo b) bar 1) baz. B) foobaz"))
  
  # Ok if part of \begin{enumerate}[label=\alph*)] etc
  enumerate <-
    c("\\begin{verysmallbox}{England's Best-Practice Tariff criteria for fragility hip fracture}{box:bestprac}", 
      "Hospitals are eligible for a top-up payment for selected patients (\\eg~those aged 60 or over) if:", 
      "\\begin{enumerate}[label=\\alph*)]",
      "\\item time from arrival in an emergency department to surgery -- or, if the patient is already admitted, time from diagnosis to the start of anaesthesia -- is within 36 hours;", 
      "\\item the patient is assessed by a geriatrician in the perioperative period (within 72 hours of admission);", 
      "\\item fracture prevention assessments (relating to falls and bone health) are completed;", 
      "\\item an abbreviated mental test is performed before surgery and the score recorded in the National Hip Fracture Database;", 
      "\\item the patient receives a nutritional assessment during admission;", 
      "\\item the patient receives delirium assessment using the `4AT screening tool' during admission; and", 
      "\\item the patient is assessed by a physiotherapist on the day of or the day after surgery.", 
      "\\end{enumerate}",
      "\\end{verysmallbox}")
  
  expect_null(check_unclosed_parentheses(tex_lines = enumerate))
  
  options("TeXCheckR.halt_on_error" = FALSE)
})




