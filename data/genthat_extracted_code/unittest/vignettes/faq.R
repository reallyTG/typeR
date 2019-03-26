### R code from vignette source 'faq.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: common.tex:14-16
###################################################
    options(width = 80)
    options(continue = ' ', prompt = ' ')


###################################################
### code chunk number 2: faq.Rnw:14-15
###################################################
    library(unittest)


###################################################
### code chunk number 3: testing_for_errors
###################################################
test_for_error <- function(code, expected_regexp) {
    tryCatch({
            code
            return("No error returned")
        }, error = function(e) {
            if(grepl(expected_regexp, e$message)) return(TRUE)
            return(c(e$message, "Did not match:-", expected_regexp))
        }
    )
}


###################################################
### code chunk number 4: faq.Rnw:41-45
###################################################
add_four <- function(x) {
    if( ! is.numeric(x) ) stop("x must be numeric")
    return( x+4 )
}


###################################################
### code chunk number 5: faq.Rnw:48-49
###################################################
ok(test_for_error(add_four("a"), "must be numeric"), "add_four() argument not numeric throws error")


###################################################
### code chunk number 6: faq.Rnw:59-62
###################################################
a <- c(1,2,3)
b <- 1:3
ok(all.equal(a,b), "a and b are equal")


###################################################
### code chunk number 7: testing_multiple_values
###################################################
cmp <- function(a, b) {
    if(identical(all.equal(a,b), TRUE)) return(TRUE)

    if (file.exists(Sys.which('git'))) {
        totmp <- function(x) {
            f <- tempfile(pattern = "str.")
            capture.output(str(x,
                vec.len = 1000,
                digits.d = 5,
                nchar.max = 1000), file = f)
            return(f)
        }

        return(suppressWarnings(system2(
            Sys.which('git'),
            c("diff", "--no-index", "--color-words", totmp(a), totmp(b)),
            input = "",
            stdout = TRUE, stderr = TRUE)))
    }

    return(c(
        capture.output(str(a)),
        "... does not equal...",
        capture.output(str(b))
    ))
}


###################################################
### code chunk number 8: grouping_tests
###################################################
ok_group("Test addition", {
    ok(1 + 1 == 2, "Can add 1")
    ok(1 + 3 == 4, "Can add 3")
})
ok_group("Test subtraction", {
    ok(1 - 1 == 0, "Can subtract 1")
    ok(1 - 3 == -2, "Can subtract 3")
})


###################################################
### code chunk number 9: faq.Rnw:121-122
###################################################
ok_group("Test addition", {
    ok(1 + 1 == 2, "Can add 1")
    ok(1 + 3 == 4, "Can add 3")
})
ok_group("Test subtraction", {
    ok(1 - 1 == 0, "Can subtract 1")
    ok(1 - 3 == -2, "Can subtract 3")
})


