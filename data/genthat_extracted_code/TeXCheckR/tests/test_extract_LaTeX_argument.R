context("Extract arguments")

test_that("Extract textbf", {
  out <- extract_LaTeX_argument("The contents of \\textbf{ABC} is abc.", "textbf")
  expect_equal(out[["extract"]], "ABC")
  expect_equal(out[["char_no_min"]], nchar("The contents of \\textbf{"))
  expect_equal(out[["char_no_max"]], nchar("The contents of \\textbf{ABC}"))
})

test_that("Extract textcites", {
  out <- extract_LaTeX_argument("Some citation by \\textcites{Knuth194}{Knuth195}", "textcites", n = 2L)
  expect_equal(out[["extract"]], "Knuth195")
  expect_equal(out[["char_no_min"]], nchar("Some citation by \\textcites{Knuth194}{"))
  expect_equal(out[["char_no_max"]], nchar("Some citation by \\textcites{Knuth194}{Knuth195}"))
})

test_that("Extract nested", {
  out <- extract_LaTeX_argument("What should this be \\emph{Some emphasized text \\emph{Double emphasized} here.}",
                                "emph")
  
  expect_equal(out[["extract"]], 
               c("Some emphasized text \\emph{Double emphasized} here.",
                 "Double emphasized"))
})

test_that("Blank line", {
  out <- extract_LaTeX_argument("", "foo")
  expect_true(nrow(out) == 0 || is.na(out[["extract"]]))
})

test_that("Optional argument", {
  out <- extract_LaTeX_argument("See \\textcite[Ante][Post]{Knuth1} [if you want].",
                                command_name = "textcite", 
                                n = 2L, 
                                optional = TRUE)
  expect_equal(out[["extract"]], "Post")
  
  out <- extract_LaTeX_argument("See \\textcite[Ante][[ex] Post]{Knuth1} [if you want].",
                                command_name = "textcite", 
                                n = 2L, 
                                optional = TRUE)
  
  expect_equal(out[["extract"]], "[ex] Post")
  
  tex_lines_with_optional <- 
    c("Sometimes \\footcite[][3]{Daley2016} we have optional args; other times not.\\footcite{Daley2016}.")
  
  output_excl_optional <- extract_LaTeX_argument(tex_lines_with_optional, "footcite")
  expect_equal(output_excl_optional[["extract"]], c("Daley2016", "Daley2016"))
  output_incl_optional <- extract_LaTeX_argument(tex_lines_with_optional,
                                                 command_name = "footcite",
                                                 optional = TRUE, 
                                                 n = 2L)
  expect_equal(output_incl_optional[["extract"]], c("3", NULL))
})

test_that("Multi-line starred", {
  out <- extract_LaTeX_argument(c("This \\footnote{", "ends", "here.}"), "footnote")
  expect_equal(out$char_no_min, c(15))
  expect_equal(out$char_no_max, c(25))
  expect_equal(out$line_no_max, c(3))
  
  
  out <- extract_LaTeX_argument(c("This \\footnote{ends quickly} where this \\footnote{", "ends", "here.}"), "footnote")
  expect_equal(out$char_no_min[1], nchar("This \\footnote{"))
  expect_equal(out$char_no_max[1], nchar("This \\footnote{ends quickly}"))
  expect_equal(out$line_no_max[1], 1)
  
})

test_that("Multi-line", {
  tex_lines <- 
    c("This is some \\textbf{bold text} and \\footnote{this is a footnote with some \\textbf{text also in boldface}}",
      "whereas \\footnote{this footnote ",
      "extends over",
      "\\emph{more}",
      "than one line.}")
  output <- extract_mandatory_LaTeX_argument(tex_lines, "footnote", by.line = TRUE)
  expect_equal(output[["extract"]],
               c("this is a footnote with some \\textbf{text also in boldface}",
                 "this footnote ",
                 "extends over",
                 "\\emph{more}", 
                 "than one line."))

  tex_lines <- 
    c("This is some \\emph{emph text} and \\emph{this",
      "text \\textbf{has} \\emph{double}",
      "emphasis.}")
  
  output <- extract_mandatory_LaTeX_argument(tex_lines, "emph", by.line = TRUE)
  setorder(output, command_no)
  expect_equal(output[["extract"]],
               c("emph text",
                 "this",
                 "text \\textbf{has} \\emph{double}",
                 "emphasis.", 
                 "double"))
  expect_equal(output[["line_no"]], c(1, 1, 2, 3, 2))
  expect_equal(output[["command_no"]], c(1, 2, 2, 2, 3))
  
  

})

test_that("Optional argument interference", {
  expect_equal(extract_mandatory_LaTeX_argument("\\abc{def}", "abc")[["extract"]], "def")
  expect_equal(extract_mandatory_LaTeX_argument("\\abc{def}{ghij}", "abc")[["extract"]], "def")
  expect_equal(extract_mandatory_LaTeX_argument("\\abc{def}{ghij}", "abc", n = 2)[["extract"]], "ghij")
  expect_equal(extract_mandatory_LaTeX_argument("\\abc[xyz]{def}{ghij}", "abc", n = 2)[["extract"]], "ghij")
  expect_equal(extract_mandatory_LaTeX_argument("\\abc[xyz]{def}{ghij}", "abc")[["extract"]], "def")
  expect_equal(extract_mandatory_LaTeX_argument("\\abc[xyz][]{def}{ghij}", "abc")[["extract"]], "def")
  expect_equal(extract_mandatory_LaTeX_argument("\\abc[xyz][\\abc{DEF}]{def}{ghij}", "abc")[["extract"]], c("def", "DEF"))
  expect_equal(extract_mandatory_LaTeX_argument("\\abcd[xyz][\\abc{DEF}]{def}{ghij}", "abc")[["extract"]], "DEF")
})


test_that("Multi-lines", {
  skip_if_not_installed("readr")
  dbl_col_fig <- readr::read_lines("extract/dbl-col-fig.tex")
  out <- extract_mandatory_LaTeX_argument(dbl_col_fig, "doublecolumnfigure", n = 2L)
  expect_true(grepl("includegraphics{atlas/boxplot-increase_in_travel_time-by-City-Weekday--MonFri-excl-holiday-1.pdf}", 
                    out[["extract"]][1], 
                    fixed = TRUE))
  expect_equal(out[["extract"]][2], "DBL-FIG-4")
  
  dbl_col_fig_parsed <- parse_tex(dbl_col_fig)
  out_by_line <- extract_mandatory_LaTeX_argument(parsed_doc = dbl_col_fig_parsed,
                                                  n = 2L,
                                                  command_name = "doublecolumnfigure",
                                                  by.line = TRUE)
  
  expect_equal(out_by_line[2][["extract"]], 
               "\\caption{The variability of CBD commuting trip times is very similar in Sydney and Melbourne}\\label{fig:aggregate-variability-CBD-commutes}")
  
  
  
})

test_that("Road congestion example", {
  skip_if_not_installed("readr")
  road_congestion <- readr::read_lines("extract/road-congestion.tex")
  
  charts_in_road_congestion <-
    extract_mandatory_LaTeX_argument(road_congestion, "includegraphics")
  
  expect_equal(nrow(charts_in_road_congestion), 28)
  
  no_opt_documentclass <- extract_optional_LaTeX_argument(road_congestion, "documentclass")
  expect_equal(nrow(no_opt_documentclass), 0)
  
  documentclass <- extract_mandatory_LaTeX_argument(road_congestion, "documentclass")
  expect_equal(documentclass[["extract"]], "grattan")
  
  
})

test_that("Whitespace gobbling", {
  out <- extract_mandatory_LaTeX_argument("\\footnote {abc}", "footnote")
  expect_equal(out[["extract"]], "abc")
  
  out <- extract_mandatory_LaTeX_argument("\\XY {cd \\XY {cd}}", "XY")
  expect_true("cd \\XY {cd}" %in% out[["extract"]])
})

test_that("Optional argument", {
  out <- extract_optional_LaTeX_argument("\\textcite[][\\textcite[a][b]c]{A}", "textcite", n = 2)
  # Simply so that (X, Y) == (Y, X) for this purpose.
  setorderv(out, "char_no_min")
  expect_equal(out$extract, c("\\textcite[a][b]c", "b"))
  
  
  out_not_by_line <- extract_optional_LaTeX_argument(c("\\documentclass[12pt,", "a4paper]{article}"), "documentclass")
  expect_equal(out_not_by_line[["extract"]], "12pt,a4paper")
  
  out_by_line <- extract_optional_LaTeX_argument(c("\\documentclass[12pt,", "a4paper]{article}"), "documentclass", by.line = TRUE)
  expect_equal(out_by_line[["extract"]], c("12pt,", "a4paper"))
})

test_that("Argument requested but missing", {
  out2 <- extract_mandatory_LaTeX_argument("\\XYZ{AA}{BB}{CC} \\XYZ{DD}{EE} \\XYZ{FF}", "XYZ", n = 2L)
  expect_equal(nrow(out2), 2)
  out3 <- extract_mandatory_LaTeX_argument("\\XYZ{AA}{BB}{CC} \\XYZ{DD}{EE} \\XYZ{FF}", "XYZ", n = 3L)
  expect_equal(nrow(out3), 1)
  
  out0 <- extract_mandatory_LaTeX_argument(" \\abc[][\\abc[][e]]{f}", "abc")
  expect_equal(out0[["extract"]], "f")
  
  
  out0 <- extract_optional_LaTeX_argument("\\XYZ{ABC}", "XYZ", n = 1L)
  expect_equal(nrow(out0), 0)
})

test_that("Environments", {
  skip_if_not_installed("readr")
  road_congestion <- readr::read_lines("extract/road-congestion.tex")
  smallbox <- extract_mandatory_LaTeX_argument(road_congestion, "begin{smallbox}")
  expect_true(all(c("Estimates of the economic costs of congestion are misused and poorly understood", 
                    "Australian motorists are sensitive to road prices",
                    "Building support for congestion charging") %in% smallbox[["extract"]]))
  smallbox_key <- extract_mandatory_LaTeX_argument(road_congestion, "begin{smallbox}", n = 2L)
  expect_true(all(substr(smallbox_key[["extract"]], 0, 4) == "box:"))
  
  optionals <- extract_optional_LaTeX_argument(road_congestion, "begin{table}")
  expect_true("!h" %in% optionals[["extract"]])
})

test_that("Optional containing square brackets", {
  out <- extract_mandatory_LaTeX_argument("\\abc[[def]]{ghi}", "abc")
  expect_equal(out[["extract"]], "ghi")
  out <- extract_optional_LaTeX_argument("\\abc[[def]][\\abc[][[xyz]]{ghi}]{jkl}", "abc")
  expect_equal(out[["extract"]], c("[def]", ""))
  
  out <- extract_optional_LaTeX_argument("\\section[{these [are] optional arguments}]{This is optional}", "section")
  expect_equal(out[["extract"]], "{these [are] optional arguments}")
})

test_that("% et sqq should not be included in extract", {
  out <- extract_mandatory_LaTeX_argument(c("\\abc{de%FGH}", "fgh}"), command_name = "abc")
  expect_equal(out[["extract"]], "defgh")
  
  out <- extract_optional_LaTeX_argument(c("\\documentclass[", 
                                           "11pt,%", 
                                           "parskip=half-",
                                           "]{scrrpert}"),
                                         command_name = "documentclass")
  expect_equal(out[["extract"]], "11pt,parskip=half-")
  
  
  out <- extract_mandatory_LaTeX_argument(c("\\ab[% \\ab{x}",
                                            "@\\ab{1}]{2}"),
                                          "ab")
  expect_equal(out[["extract"]], c("2", "1"))
  
  out <- extract_optional_LaTeX_argument(c("\\ab[% \\ab{x}",
                                           "@\\ab{1}]{2}"),
                                         "ab")
  expect_equal(out[["extract"]], "@\\ab{1}")
})


