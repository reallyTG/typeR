source('sanitizeCovr.R')

test_that('single target markdownRule', {
  r <- markdownRule(target='target.pdf', script='script.Rmd', depends=c('dep1', 'dep2'))
  expect_true(is.rule(r))
  expect_equal(r$target, 'target.pdf')
  expect_equal(r$pattern, 'target.pdf')
  expect_equal(r$depends, c('script.Rmd', 'dep1', 'dep2'))
  expect_equal(r$clean, '$(RM) target.pdf')
  expect_equal(sanitizeCovr(r$build),
               c('$(R) -e \'{\' \\',
                 ifelse(getRversion() > '3.4.4',
                        '-e \'    params <- list(.target = \"target.pdf\", .script = \"script.Rmd\", .depends = c(\"dep1\", \"dep2\"), .format = \"all\", .task = \"all\")\' \\',
                        '-e \'    params <- structure(list(.target = \"target.pdf\", .script = \"script.Rmd\", .depends = c(\"dep1\", \"dep2\"), .format = \"all\", .task = \"all\"), .Names = c(\".target\", \".script\", \".depends\", \".format\", \".task\"))\' \\'),
                 '-e \'    rmarkdown::render("script.Rmd", output_format = "all", output_file = "target.pdf")\' \\',
                 '-e \'}\''))
})

test_that('multiple target markdownRule', {
  r <- markdownRule(target=c('target.pdf', 'target.docx'),
                      script='script.Rmd',
                      depends=c('dep1', 'dep2'))
  expect_true(is.rule(r))
  expect_equal(r$target, c('target.pdf', 'target.docx'))
  expect_equal(r$pattern, c('target%pdf', 'target%docx'))
  expect_equal(r$depends, c('script.Rmd', 'dep1', 'dep2'))
  expect_equal(r$clean, '$(RM) target.pdf target.docx')
  expect_equal(sanitizeCovr(r$build),
               c('$(R) -e \'{\' \\',
                 ifelse(getRversion() > '3.4.4',
                        '-e \'    params <- list(.target = c(\"target.pdf\", \"target.docx\"), .script = \"script.Rmd\", .depends = c(\"dep1\", \"dep2\"), .format = \"all\", .task = \"all\")\' \\',
                        '-e \'    params <- structure(list(.target = c(\"target.pdf\", \"target.docx\"), .script = \"script.Rmd\", .depends = c(\"dep1\", \"dep2\"), .format = \"all\", .task = \"all\"), .Names = c(\".target\", \".script\", \".depends\", \".format\", \".task\"))\' \\'),
                 '-e \'    rmarkdown::render("script.Rmd", output_format = "all", output_file = c("target.pdf", "target.docx"))\' \\',
                 '-e \'}\''))
})
