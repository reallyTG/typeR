context("Master function creates a folder and repo")
Sys.setenv("R_TESTS" = "")
checkSkip <- function()
{
    if(Sys.getenv('SKIP_TESTS') == 'yes')
        skip('Skip tests')
}

theUser <- 'jaredlander'
repoName <- 'SuperTester'
repoPath <- tempdir()
theToken <- 'GITHUB_PAT'
delToken <- 'GITHUB_TESTER'

teardown({
    unlink(repoPath, recursive=TRUE, force=TRUE)
    gone <- RepoGenerator:::deleteGitHubRepo(
        owner=theUser,
        repoName=repoName,
        token=Sys.getenv(delToken)
    )
})

test_that('Create objects here', {
    skip_on_cran()
    skip_if(Sys.getenv(theToken) == '')
    checkSkip()
    
    newRepo <- createRepo(name=repoName, path=repoPath, 
                          user=theUser, token=theToken)
})

test_that("The repo was created successfully on disc", {
    skip_on_cran()
    # skip_if(Sys.getenv(theToken) == '')
    checkSkip()
    
    # expect_true(newRepo)
    expect_true(dir.exists(repoPath))
    
})

test_that('The repo was created on GitHub', {
    skip_on_cran()
    # skip_if(Sys.getenv(theToken) == '')
    checkSkip()
    
    repoExists <- RepoGenerator:::checkGitHubRepoExists(
        owner=theUser,
        repoName=repoName,
        token=Sys.getenv(theToken)
    )
    
    expect_is(repoExists, 'response')
    expect_equal(repoExists$status_code, 200)
})

test_that("If no path is given there's an error", {
    expect_error(createRepo(name=repoName,
                            user=theUser, 
                            organizer='Lander Analytics',
                            token=theToken),
                 "You must specify a path to for the generated repo."
    )
})
