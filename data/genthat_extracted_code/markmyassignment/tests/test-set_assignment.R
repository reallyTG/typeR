
context("set_assignment")

test_that(desc="set_assignment()",{
  correct_url1 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment01.yml"
  correct_url2 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment02.yml"
  correct_url3 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment03.yml"
  correct_url4 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment04.yml"
  correct_url5 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment05.yml"
  wrong_url1 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_lab_file.R"
  wrong_url2 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/file_that_do_not_exist.R"
  super_wrong_path <- "XXX"
  correct_local1 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")
  correct_local2 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment02.yml")
  wrong_local1 <- file.path(system.file(package = "markmyassignment"), "extdata/example_lab_file.R")
  wrong_local2 <- file.path(system.file(package = "markmyassignment"), "file_that_do_not_exist.R")
  
  expect_is(suppressMessages(set_assignment(correct_url1)), "character")
  expect_warning(suppressMessages(set_assignment(path = correct_url2)))
  expect_is(suppressMessages(set_assignment(path = correct_url4)), "character")
  expect_is(suppressMessages(set_assignment(correct_local1)), "character")
  expect_warning(suppressMessages(set_assignment(correct_local2)))
  expect_error(set_assignment(path = correct_url3))
  expect_error(set_assignment(path = correct_url5))
  expect_error(set_assignment(path = wrong_url1))
  expect_error(set_assignment(wrong_url2))
  expect_error(set_assignment(wrong_local1))
  expect_error(set_assignment(wrong_local2))
  expect_error(set_assignment(super_wrong_path))
  
  
  github_url1 <- "https://github.com/MansMeg/markmyassignment/blob/master/inst/extdata/example_assignment01.yml"
  github_url2 <- "https://api.github.com/repos/MansMeg/markmyassignment/contents/inst/extdata/example_assignment01.yml"
  
  expect_is(suppressMessages(set_assignment(github_url1)), "character")
  expect_is(suppressMessages(set_assignment(github_url2)), "character")
  
})

test_that(desc="show_tasks()",{
  correct_url4 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment04.yml"
  suppressMessages(set_assignment(correct_url4))
  expect_equal(show_tasks(), c("task1"))
  
  correct_local1 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")
  correct_local2 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment02.yml")
  suppressMessages(set_assignment(correct_local1))
  expect_equal(show_tasks(), c("task1","task2"))
  expect_warning(suppressMessages(set_assignment(correct_local2)))
  expect_equal(suppressWarnings(show_tasks()), c("task1","task2"))
})

test_that(desc="show_assignment()",{
  correct_url4 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment04.yml"
  suppressMessages(set_assignment(correct_url4))
  expect_output(show_assignment(), "Test assignment 04")
  expect_output(show_assignment(), "task1")
})


test_that(desc="check_installed_packages()",{
  assgn_path <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment08_bad_pkgs.yml")
  expect_warning(suppressMessages(set_assignment(path = assgn_path)))
  assgn_path <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment07_pkgs.yml")
  expect_warning(suppressMessages(set_assignment(path = assgn_path)))
  library(codetools)
  expect_is(suppressMessages(set_assignment(assgn_path)), "character")
  detach(name = "package:codetools")
})


# path_type <- markmyassignment:::path_type
test_that(desc="path_type()",{
  correct_url1 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment01.yml"
  correct_url2 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment02.yml"
  wrong_url1 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/file_that_do_not_exist.R"
  wrong_url2 <- "XXX"
  github_url1 <- "https://api.github.com/repos/octokit/octokit.rb/contents/README/README.md"
  github_url2 <- "https://api.github.com/repos/octokit/octokit.rb/git/blobs/3d21ec53a331a6f037a91c368710b99387d012c1"
  github_url3 <- "https://github.com/octokit/octokit.rb/blob/master/README/README.md"
  github_url4 <- "https://raw.githubusercontent.com/octokit/octokit.rb/master/README.md"
  correct_local1 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")
  correct_local2 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment02.yml")
  

  expect_silent(pt <- path_type(correct_url1))
  expect_class(pt, classes = c("path_http", "path_type"))
  expect_names(names(pt), permutation.of = "path")
  
  expect_silent(pt <- path_type(correct_url2))
  expect_class(pt, classes = c("path_http", "path_type"))
  expect_names(names(pt), permutation.of = "path")
  
  expect_error(pt <- path_type(wrong_url1))
  expect_error(pt <- path_type(wrong_url2))

  expect_silent(suppressMessages(pt <- path_type(github_url1)))
  expect_class(pt, classes = c("path_github", "path_type"))
  expect_names(names(pt), permutation.of = c("path", "owner", "repo", "branch", "subpath"))

  expect_silent(suppressMessages(pt <- path_type(github_url2)))
  expect_class(pt, classes = c("path_github", "path_type"))
  expect_names(names(pt), permutation.of = c("path", "owner", "repo", "branch", "subpath"))
  
  expect_silent(pt <- path_type(github_url3))
  expect_class(pt, classes = c("path_github", "path_type"))
  expect_names(names(pt), permutation.of = c("path", "owner", "repo", "branch", "subpath"))

  expect_silent(pt <- path_type(github_url4))
  expect_class(pt, classes = c("path_http", "path_type"))
  expect_names(names(pt), permutation.of = c("path"))
  
  expect_silent(pt <- path_type(correct_local1))
  expect_class(pt, classes = c("path_local", "path_type"))
  expect_names(names(pt), permutation.of = c("path"))

  expect_silent(pt <- path_type(correct_local2))
  expect_class(pt, classes = c("path_local", "path_type"))
  expect_names(names(pt), permutation.of = c("path"))
    
})

# get_assignment_full_subpath <- markmyassignment:::get_assignment_full_subpath
test_that(desc="get_assignment_full_subpath()",{
  correct_url1 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment01.yml"
  correct_url1_path_type <- path_type(correct_url1)
  correct_url2 <- "https://raw.githubusercontent.com/MansMeg/markmyassignment/master/inst/extdata/example_assignment02.yml"
  correct_url2_path_type <- path_type(correct_url2)
  
  correct_local1 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")
  correct_local1_path_type <- path_type(correct_local1)
  correct_local2 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment02.yml")
  correct_local2_path_type <- path_type(correct_local2)
  
  expect_error(get_assignment_full_subpath(sub_path = "test.R", correct_url1_path_type))
  expect_silent(fp <- get_assignment_full_subpath(sub_path = "example_assignment02.yml", correct_url1_path_type))
  expect_equal(fp$path, correct_url2)
  expect_silent(fp <- get_assignment_full_subpath(sub_path = correct_url1, correct_url1_path_type))

  expect_error(get_assignment_full_subpath(sub_path = "test.R", correct_url2_path_type))
  expect_silent(fp <- get_assignment_full_subpath(sub_path = "example_assignment01.yml", correct_url1_path_type))
  expect_equal(fp$path, correct_url1)
  expect_silent(fp <- get_assignment_full_subpath(sub_path = correct_url2, correct_url2_path_type))

  expect_error(get_assignment_full_subpath(sub_path = "test.R", correct_local1_path_type))
  expect_silent(fp <- get_assignment_full_subpath(sub_path = "example_assignment02.yml", correct_local1_path_type))
  expect_equal(fp$path, correct_local2)
  expect_silent(fp <- get_assignment_full_subpath(sub_path = correct_local1, correct_local1_path_type))
  
  expect_error(get_assignment_full_subpath(sub_path = "test.R", correct_local2_path_type))
  expect_silent(fp <- get_assignment_full_subpath(sub_path = "example_assignment01.yml", correct_local2_path_type))
  expect_equal(fp$path, correct_local1)
  expect_silent(fp <- get_assignment_full_subpath(sub_path = correct_local2, correct_local2_path_type))
  
})


test_that(desc="remove_assignment()",{
  correct_local1 <- file.path(system.file(package = "markmyassignment"), "extdata/example_assignment01.yml")

  expect_is(suppressMessages(set_assignment(correct_local1)), "character")
  expect_equal(show_tasks(), c("task1", "task2"))
  
  expect_silent(remove_assignment())
  expect_error(show_tasks(), regexp = "No assignment has been set")
  
})



test_that(desc="assignment_template",{
  assignment_template_file <- file.path(system.file(package = "markmyassignment"), "extdata/assignment_template.yml")
  expect_message(set_assignment(assignment_template_file), regexp = "Assignment template")
  remove_assignment()
})

