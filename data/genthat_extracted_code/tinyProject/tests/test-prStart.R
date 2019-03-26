context("Function prStart")

dir <- tempdir()
setwd(dir)

if (dir.exists("project-test")) unlink("project-test", recursive = TRUE)
dir.create("project-test")
setwd("project-test")

prInit()

describe("prStart", {
  it("return TRUE if everything is alright", {
    expect_true(prStart(trace=FALSE))
  })
  
  it("sources the start.R script", {
    value <- sample(1e6, 1)
    cat("startVar <-", value, file = "scripts/start.R")
    prStart(trace=FALSE)
    expect_equal(value, startVar)
  })
  
  it("sources scripts prefixed by 'tools'", {
    value <- sample(1e6, 2)
    cat("var1 <-", value[1], file = "scripts/toolsTest.R")
    dir.create("scripts/test")
    cat("var2 <-", value[2], file = "scripts/test/toolsTest.R")
    prStart(trace=FALSE)
    expect_equal(value[1], var1)
    expect_equal(value[2], var2)
  })
  
  it("sources scripts in the 'scripts/tools' directory", {
    value <- sample(1e6, 1)
    dir.create("scripts/tools")
    cat("var3 <-", value, file = "scripts/tools/test.R")
    prStart(trace=FALSE)
    expect_equal(value, var3)
  })
  
  it("returns FALSE if something has gone wrong", {
    cat("stop()", file = "scripts/toolsError.R")
    expect_false(prStart(trace=FALSE))
  })
  
  it("also works in a subdirectory", {
    file.remove("scripts/toolsError.R")
    setwd("..")
    expect_true(prStart("project-test", trace=FALSE))
  })
  
})