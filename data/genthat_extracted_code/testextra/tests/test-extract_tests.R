#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `extract_tests.R`')
#line 46 "R/extract_tests.R"
test_that('.pkg_base', {#@testing
    test.pkg.src <- system.file("testExtractionTest", "R", package = "testextra")
    pkg <- normalizePath( file.path(tempdir(), "testExtractionTest")
                        , "/", mustWork = FALSE)
    if (dir.exists(pkg))
        unlink(pkg, recursive = TRUE, force = TRUE)

    suppress_messages(
    package.skeleton("testExtractionTest", path=tempdir()
                    , code_files = list.files(test.pkg.src, full=TRUE)
                    ))
    expect_identical(.pkg_base(pkg), pkg)
    expect_identical(.pkg_base(file.path(pkg, "R", fsep = '/')), pkg)
    expect_identical(.pkg_base(file.path(pkg, "R", "Class.R", fsep = '/')), pkg)

    unlink(file.path(pkg, "DESCRIPTION", fsep = '/'))
    expect_null(.pkg_base(pkg))

    unlink(pkg, recursive = TRUE, force = TRUE)
})
#line 117 "R/extract_tests.R"
test_that('.extract_tests_to_file Basic', {#@testing .extract_tests_to_file Basic
{'hello_world <- function(){
    print("hello world")
}
if(FALSE){#!@testthat
    expect_output(hello_world(), "hello world")
}

f2 <- function(){stop("this does nothing")}
if(F){#! @test
    expect_error(f2())
}
if(F){#! example
    hw()
}
'}-> text
tmp.in  <- normalizePath(tempfile("src-" , fileext=".R"), '/', FALSE)
tmp.out <- normalizePath(tempfile("test-", fileext=".R"), '/', FALSE)
if (!dir.exists(. <- dirname(tmp.in))) dir.create(.)

writeLines(text, tmp.in)

x <- .extract_tests_to_file(tmp.in, tmp.out, verbose=FALSE)

expect_true ( file.exists(tmp.out))
expect_equal( lines <- readLines(tmp.out)
            , c( "#! This file was automatically produced by the testextra package."
               , "#! Changes will be overwritten."
               , ""
               , sprintf("context('tests extracted from file `%s`')", basename(tmp.in))
               , sprintf("#line 4 \"%s\"", tmp.in)
               , "test_that('hello_world', {#!@testthat"
               , "    expect_output(hello_world(), \"hello world\")"
               , "})"
               , sprintf("#line 9 \"%s\"", tmp.in)
               , "test_that('f2', {#! @test"
               , "    expect_error(f2())"
               , "})"
               ))
expect_equal(x, structure(c("hello_world", "f2"), test.file = tmp.out))
unlink(tmp.out)

expect_message( x <- .extract_tests_to_file(tmp.in, tmp.out, verbose=TRUE)
              , "* Extracting tests from file `.*`."
              )
expect_true (file.exists(tmp.out))
expect_equal( lines
            , c( "#! This file was automatically produced by the testextra package."
               , "#! Changes will be overwritten."
               , ""
               , sprintf("context('tests extracted from file `%s`')", basename(tmp.in))
               , sprintf("#line 4 \"%s\"", tmp.in)
               , "test_that('hello_world', {#!@testthat"
               , "    expect_output(hello_world(), \"hello world\")"
               , "})"
               , sprintf("#line 9 \"%s\"", tmp.in)
               , "test_that('f2', {#! @test"
               , "    expect_error(f2())"
               , "})"
               ))
expect_equal(x, structure(c("hello_world", "f2"), test.file = tmp.out))

val <- .extract_tests_to_file(tmp.in, tmp.out, verbose=FALSE, force=FALSE)
expect_identical(val, structure(character(0), test.file=tmp.out))
expect_message( val <- .extract_tests_to_file(tmp.in, tmp.out, verbose=TRUE, force=FALSE)
              , "  \\+ file `" %<<<% tmp.out %<<<% "` is newer\\.  SKIPPING\\."
              )

val <- .extract_tests_to_file(tmp.in, tmp.out, verbose=FALSE, force=TRUE)
expect_equal(val, structure(c("hello_world", "f2"), test.file = tmp.out))

unlink(tmp.out)


withr::with_dir(dirname(tmp.in), {
    if (dir.exists('tests')) unlink('tests', recursive = TRUE, force = TRUE)
    x <- .extract_tests_to_file( file = basename(tmp.in)
                               , file.out = NULL
                               , NULL
                               , verbose=FALSE)
    file.out <- file.path('.', "test-" %<<<% basename(tmp.in), fsep='/')
    expect_true(file.exists(file.out))
    expect_equal( lines <- readLines(file.out)
                , c( "#! This file was automatically produced by the testextra package."
                   , "#! Changes will be overwritten."
                   , ""
                   , sprintf("context('tests extracted from file `%s`')", basename(tmp.in))
                   , sprintf("#line 4 \"%s\"", basename(tmp.in))
                   , "test_that('hello_world', {#!@testthat"
                   , "    expect_output(hello_world(), \"hello world\")"
                   , "})"
                   , sprintf("#line 9 \"%s\"", basename(tmp.in))
                   , "test_that('f2', {#! @test"
                   , "    expect_error(f2())"
                   , "})"
                   ))
    expect_equal(x, structure(c("hello_world", "f2")
                     , test.file = file.out))
    unlink(file.out)
})
withr::with_dir(dirname(tmp.in), {
    if (!dir.exists('tests')) dir.create('tests') else
    if ( dir.exists('tests/testthat')) unlink('tests/testthat', TRUE, TRUE)
    expect_message({
        x <- .extract_tests_to_file( file = basename(tmp.in)
                                   , file.out = NULL
                                   , NULL
                                   , verbose=TRUE)
    }, "  \\+ `test.dir` not provided. Setting to `.*`")
    file.out <- "./tests/test-" %<<<% basename(tmp.in)
    expect_true(file.exists(file.out))
    expect_equal( lines <- readLines(file.out)
                , c( "#! This file was automatically produced by the testextra package."
                   , "#! Changes will be overwritten."
                   , ""
                   , sprintf("context('tests extracted from file `%s`')", basename(tmp.in))
                   , sprintf("#line 4 \"%s\"", basename(tmp.in))
                   , "test_that('hello_world', {#!@testthat"
                   , "    expect_output(hello_world(), \"hello world\")"
                   , "})"
                   , sprintf("#line 9 \"%s\"", basename(tmp.in))
                   , "test_that('f2', {#! @test"
                   , "    expect_error(f2())"
                   , "})"
                   ))
    expect_equal(x, structure(c("hello_world", "f2"), test.file = file.out))
    unlink(file.out)
    unlink("tests", force = TRUE)
})
withr::with_dir(dirname(tmp.in), {
    if (!dir.exists('tests/testthat'))
        dir.create('tests/testthat', recursive = TRUE)
    tryCatch({
    expect_true(file.exists(basename(tmp.in)))
    expect_message({
        x <- .extract_tests_to_file( file = basename(tmp.in)
                                   , file.out = NULL
                                   , test.dir = NULL
                                   , verbose=TRUE)
    }, "  \\+ Writting extracted tests to `.*`.")
    file.out <- "./tests/testthat/test-" %<<<% basename(tmp.in)
    expect_true(file.exists(file.out))
    expect_equal( lines <- readLines(file.out)
                , c( "#! This file was automatically produced by the testextra package."
                   , "#! Changes will be overwritten."
                   , ""
                   , sprintf("context('tests extracted from file `%s`')", basename(tmp.in))
                   , sprintf("#line 4 \"%s\"", basename(tmp.in))
                   , "test_that('hello_world', {#!@testthat"
                   , "    expect_output(hello_world(), \"hello world\")"
                   , "})"
                   , sprintf("#line 9 \"%s\"", basename(tmp.in))
                   , "test_that('f2', {#! @test"
                   , "    expect_error(f2())"
                   , "})"
                   ))
    expect_equal(x, structure(c("hello_world", "f2"), test.file = file.out))
    }, finally = unlink(file.path(tempdir(), "tests"), TRUE, TRUE))
})
expect_false(dir.exists(file.path(tempdir(), "tests")))

unlink(tmp.in)
})
#line 280 "R/extract_tests.R"
test_that('.extract_tests_to_file setClass', {#@testing .extract_tests_to_file setClass
{'
setClass("Test-Class")
if(FALSE){#!@test
    expect_true(TRUE)
    expect_is(getClass("Test-Class"), "classRepresentation")
}
'}-> class.text

tmp.in  <- tempfile("src-" , fileext=".R")
tmp.out <- tempfile("test-", fileext=".R")

writeLines(class.text, tmp.in)
x <- .extract_tests_to_file(tmp.in, tmp.out, verbose=FALSE)
lines <- readLines(tmp.out)

expect_true (file.exists(tmp.out))
expect_equal( lines
            , c( "#! This file was automatically produced by the testextra package."
               , "#! Changes will be overwritten."
               , ""
               , sprintf("context('tests extracted from file `%s`')", basename(tmp.in))
               , sprintf("#line 3 \"%s\"", tmp.in)
               , "test_that('setClass(\"Test-Class\", ...)', {#!@test"
               , "    expect_true(TRUE)"
               , "    expect_is(getClass(\"Test-Class\"), \"classRepresentation\")"
               , "})"
               )
            )
expect_equal(x, structure("setClass(\"Test-Class\", ...)", test.file = tmp.out))

unlink(tmp.in)
unlink(tmp.out)
})
#line 314 "R/extract_tests.R"
test_that('.extract_tests_to_file setMethod', {#@testing .extract_tests_to_file setMethod
'
setMethod("show", "Test-Class", function(x){cat("hi")})
if(FALSE){#!@test
    expect_true(TRUE)
}
'-> method.text
tmp.in  <- tempfile("src-" , fileext=".R")
tmp.out <- tempfile("test-", fileext=".R")

writeLines(method.text, tmp.in)
x <- .extract_tests_to_file(tmp.in, tmp.out, verbose=FALSE)
lines <- readLines(tmp.out)

expect_true (file.exists(tmp.out))
expect_equal( lines
            , c( "#! This file was automatically produced by the testextra package."
               , "#! Changes will be overwritten."
               , ""
               , sprintf("context('tests extracted from file `%s`')", basename(tmp.in))
               , sprintf("#line 3 \"%s\"", tmp.in)
               , "test_that('show,Test-Class-method', {#!@test"
               , "    expect_true(TRUE)"
               , "})"
               )
            )
expect_equal(x, structure("show,Test-Class-method", test.file = tmp.out))

unlink(tmp.in)
unlink(tmp.out)
})
#line 345 "R/extract_tests.R"
test_that('.extract_tests_to_file setGeneric', {#@testing .extract_tests_to_file setGeneric
'
setGeneric("yolo", yolo::yolo)
if(FALSE){#!@test
    expect_true(TRUE)
}
'-> generic.text
tmp.in  <- tempfile("src-" , fileext=".R")
tmp.out <- tempfile("test-", fileext=".R")

writeLines(generic.text, tmp.in)
x <- .extract_tests_to_file(tmp.in, tmp.out, verbose=FALSE)
lines <- readLines(tmp.out)

expect_true (file.exists(tmp.out))
expect_equal( lines
            , c( "#! This file was automatically produced by the testextra package."
               , "#! Changes will be overwritten."
               , ""
               , sprintf("context('tests extracted from file `%s`')", basename(tmp.in))
               , sprintf("#line 3 \"%s\"", tmp.in)
               , "test_that('setGeneric(\"yolo\", ...)', {#!@test"
               , "    expect_true(TRUE)"
               , "})"
               )
            )
expect_equal(x, structure("setGeneric(\"yolo\", ...)", test.file = tmp.out))
})
#line 373 "R/extract_tests.R"
test_that('.extract_tests_to_file no test blocks', {#@testing .extract_tests_to_file no test blocks
'hello_world <- function(){
    print("hello world")
}

f2 <- function(){stop("this does nothing")}
if(F){#! example
    hw()
}
'-> text
tmp.in  <- tempfile("src-" , fileext=".R")
tmp.out <- tempfile("test-", fileext=".R")

writeLines(text, tmp.in)
expect_message( x <- .extract_tests_to_file(tmp.in, tmp.out, verbose=TRUE)
              , class = "testextra-message")
expect_identical(x, character())
expect_false (file.exists(tmp.out))
})
#line 497 "R/extract_tests.R"
test_that('extract_tests', {#@testing
    tmp.dir <- normalizePath(tempdir(), '/', TRUE)
    if (!dir.exists(tmp.dir)) dir.create(tmp.dir)
    if (dir.exists(. <- file.path(tmp.dir, "testExtractionTest")))
        unlink(., recursive = TRUE, force = TRUE)
    package.skeleton("testExtractionTest", path=tmp.dir, force=TRUE
                    , code_files = list.files(system.file("testExtractionTest", "R", package='testextra'), full=TRUE)
                    )
    pkg <- file.path(tmp.dir, "testExtractionTest", fsep='/')
    expect_warning( result <- extract_tests(pkg)
                  , "testthat not found in suggests. `extract_tests` assumes a testthat infrastructure.")
    test.dir <- file.path(tmp.dir, 'testExtractionTest', 'tests', 'testthat', fsep='/')
    expected <- structure( list( structure(c( "setClass(\"Test-Class\", ...)"
                                    , "show,Test-Class-method"
                                    , "setGeneric(\"yolo\", ...)"
                                    )
                                  , test.file = file.path(test.dir, 'test-Class.R', fsep='/')
                                  )
                               , structure("hello_world"
                                  , test.file = file.path(test.dir, 'test-function.R', fsep='/')
                                  )
                               )
                         , names = file.path('R', c('Class.R', 'function.R'))
                         )
    test.dir <- normalizePath(file.path(pkg, "tests", "testthat"), '/', FALSE)
    expect_identical(list.files(test.dir), c('test-Class.R', 'test-function.R'))

    file <- file.path(test.dir, 'test-Class.R')
    expect_identical( readLines(file)[c(1:5)]
                    , c( "#! This file was automatically produced by the testextra package."
                       , "#! Changes will be overwritten."
                       , ""
                       , "context('tests extracted from file `Class.R`')"
                       , "#line 4 \"R/Class.R\""
                       )
                    )

    expect_equal( result, expected)
    expect_true(dir.exists(file.path(pkg, "tests", "testthat")))
    expect_true(file.exists(file.path(pkg, "tests", "testthat", "test-Class.R")))
    expect_true(file.exists(file.path(pkg, "tests", "testthat", "test-function.R")))

    description <- as.data.frame(read.dcf(file.path(pkg, 'DESCRIPTION')))
    description$Suggests <- collapse(c('testthat', 'testextra'), ", ")
    write.dcf(description, file=file.path(pkg, 'DESCRIPTION'))

    unlink(sapply(expected, attr, 'test.file'))
    expect_silent(result <- extract_tests(pkg, full.path = TRUE))
    expected <- structure( expected
                         , names = file.path(pkg, 'R', c('Class.R', 'function.R'), fsep ="/"))
    expect_identical(result, expected)

    file <- file.path(test.dir, 'test-Class.R')
    from <- normalizePath(file.path(pkg, "R", "Class.R"), '/', FALSE)
    expect_identical( readLines(file)[c(1:5)]
                    , c( "#! This file was automatically produced by the testextra package."
                       , "#! Changes will be overwritten."
                       , ""
                       , "context('tests extracted from file `" %<<<% from %<<<% "`')"
                       , "#line 4 \"" %<<<% from %<<<%"\""
                       )
                    )


    unlink(sapply(expected, attr, 'test.file'))
    expect_silent(result <- extract_tests(pkg, full.path = FALSE))
    expected <- structure( expected
                         , names = c('Class.R', 'function.R')
                         )
    expect_identical(result, expected)

    file <- file.path(test.dir, 'test-Class.R')
    from <- normalizePath(file.path(pkg, "R", "Class.R"), '/', FALSE)
    expect_identical( readLines(file)[c(1:5)]
                    , c( "#! This file was automatically produced by the testextra package."
                       , "#! Changes will be overwritten."
                       , ""
                       , "context('tests extracted from file `" %<<<% basename(from) %<<<% "`')"
                       , "#line 4 \"" %<<<% basename(from) %<<<%"\""
                       )
                    )

    unlink(pkg, recursive=TRUE, force = TRUE)
})
#line 581 "R/extract_tests.R"
test_that('extract_tests', {#@testing
    pkg <- file.path(tempdir(), "testExtractionTest")
    if (dir.exists(pkg))
        unlink(pkg, recursive = TRUE, force = TRUE)
    package.skeleton("testExtractionTest", path=tempdir()
                    , code_files = list.files(system.file("testExtractionTest", "R", package='testextra'), full=TRUE)
                    )
    test.dir <- normalizePath(file.path(pkg, "tests", "testthat"), '/', mustWork = FALSE)

    description <- as.data.frame(read.dcf(file.path(pkg, 'DESCRIPTION')))
    description$Suggests <- collapse(c('testthat', 'testextra'), ", ")
    write.dcf(description, file=file.path(pkg, 'DESCRIPTION'))

    expect_identical(list.files(test.dir, full.names = TRUE),character())
    result <- extract_tests(pkg, filter='Class', full.path = FALSE)
    expect_length(result, 1)
    expect_length(result[[1]], 3)
    expect_equal( structure(result[[1]], test.file=NULL)
                , c( 'setClass("Test-Class", ...)'
                   , 'show,Test-Class-method'
                   , 'setGeneric("yolo", ...)'
                   )
                )
    expect_equal( normalizePath(attr(result[[1]], "test.file"))
                , normalizePath(file.path(test.dir, 'test-Class.R', fsep='/'))
                )

    expect_true(dir.exists(test.dir))
    expect_identical( list.files(test.dir, full.names = FALSE)
                    , 'test-Class.R'
                    )

    expect_error(extract_tests(pkg, filter='bad filter', full.path = FALSE)
                , "Filtered to no files to extract from\\.")

    unlink(pkg, recursive = TRUE, force=TRUE)
})
