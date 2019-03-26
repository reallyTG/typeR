
context("is_github_path")

test_that(desc="is_github_path",{
  expect_true(is_github_path("https://api.github.com/repos/octokit/octokit.rb/contents/README.md"))
  expect_true(is_github_path("https://github.com/octokit/octokit.rb/blob/master/README.md"))
  expect_true(is_github_path("https://raw.githubusercontent.com/octokit/octokit.rb/master/README.md"))
  expect_false(is_github_path("https://google/octokit/octokit.rb/blob/github/README.md"))

  expect_names(names(is_github_path("https://api.github.com/repos/octokit/octokit.rb/contents/README.md")), identical.to = "api_contents")
  expect_names(names(is_github_path("https://api.github.com/repos/octokit/octokit.rb/git/blobs/3d21ec53a331a6f037a91c368710b99387d012c1")), identical.to = "api_git")
  expect_names(names(is_github_path("https://github.com/octokit/octokit.rb/blob/master/README.md")), identical.to = "http")
  expect_names(names(is_github_path("https://raw.githubusercontent.com/octokit/octokit.rb/master/README.md")), identical.to = "raw")
  expect_null(names(is_github_path("https://google/octokit/octokit.rb/blob/github/README.md")))
})


test_that(desc="get_github_path_info",{
  
  path1 <- "https://api.github.com/repos/octokit/octokit.rb/contents/README/README.md"
  path2 <- "https://api.github.com/repos/octokit/octokit.rb/git/blobs/3d21ec53a331a6f037a91c368710b99387d012c1"
  path3 <- "https://github.com/octokit/octokit.rb/blob/master/README/README.md"
  path4 <- "https://raw.githubusercontent.com/octokit/octokit.rb/master/README/README.md"
  
  expect_message(gpi <- get_github_path_info(path1))
  expect_class(gpi, classes = "github_path_info")
  checkmate::expect_names(names(gpi), permutation.of = c("owner", "repo", "path", "branch"))
  expect_equal(gpi$owner, "octokit")
  expect_equal(gpi$repo, "octokit.rb")
  expect_equal(gpi$branch, "master")  
  expect_equal(gpi$path, "README/README.md")
  
  expect_message(gpi <- get_github_path_info(path2))
  expect_class(gpi, classes = "github_path_info")
  checkmate::expect_names(names(gpi), permutation.of = c("owner", "repo", "path", "branch"))
  expect_equal(gpi$owner, "octokit")
  expect_equal(gpi$repo, "octokit.rb")
  expect_equal(gpi$branch, "master")  
  expect_equal(gpi$path, as.character(NA))
  
  expect_silent(gpi <- get_github_path_info(path3))
  expect_class(gpi, classes = "github_path_info")
  checkmate::expect_names(names(gpi), permutation.of = c("owner", "repo", "path", "branch"))
  expect_equal(gpi$owner, "octokit")
  expect_equal(gpi$repo, "octokit.rb")
  expect_equal(gpi$branch, "master")
  expect_equal(gpi$path, "README/README.md")

  expect_silent(gpi <- get_github_path_info(path4))
  expect_class(gpi, classes = "github_path_info")
  checkmate::expect_names(names(gpi), permutation.of = c("owner", "repo", "path", "branch"))
  expect_equal(gpi$owner, "octokit")
  expect_equal(gpi$repo, "octokit.rb")
  expect_equal(gpi$branch, "master")  
  expect_equal(gpi$path, "README/README.md")
  
})

