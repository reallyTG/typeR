context("Create and delete a GitHub repo")

theUser <- 'jaredlander'
repoName <- 'SuperTester'
theToken <- 'GITHUB_PAT'
delToken <- 'GITHUB_TESTER'

test_that("The repo creation succeeded", {
    skip_on_cran()
    # skip('Need to figure out how to handle the env vars')
    created <- RepoGenerator:::createGitHubRepo(repoName=repoName,
                                                token=Sys.getenv(theToken))
    expect_is(created, 'response')
    expect_equal(created$status_code, 201)
})

test_that("The repo exists on Github", {
    skip_on_cran()
    # skip('Need to figure out how to handle the env vars')
    repoExists <- RepoGenerator:::checkGitHubRepoExists(
        owner=theUser,
        repoName=repoName,
        token=Sys.getenv(theToken)
    )
    
    expect_is(repoExists, 'response')
    expect_equal(repoExists$status_code, 200)
})

test_that("The repo is deleted", {
    skip_on_cran()
    # skip('Need to figure out how to handle the env vars')
    deleted <- RepoGenerator:::deleteGitHubRepo(
        owner=theUser,
        repoName=repoName,
        token=Sys.getenv(delToken)
    )
    
    expect_is(deleted, 'response')
    expect_equal(deleted$status_code, 204)
})

test_that("The repo is gone from Github", {
    skip_on_cran()
    # skip('Need to figure out how to handle the env vars')
    isGone <- RepoGenerator:::checkGitHubRepoExists(
        owner=theUser,
        repoName=repoName,
        token=Sys.getenv(theToken)
    )
    
    expect_is(isGone, 'response')
    expect_equal(isGone$status_code, 404)
})
