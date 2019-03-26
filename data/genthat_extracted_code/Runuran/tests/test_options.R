## --------------------------------------------------------------------------
##
## Check function Runuran.options()
##
## --------------------------------------------------------------------------

context("[Runuran.options] - set package options")

## --------------------------------------------------------------------------

mkmsg.e <- function(...) { makemsg.e("Runuran\\.options",...) }

## --------------------------------------------------------------------------

test_that("[opts-01] calling Runuran.options", {
    old.opts <- Runuran.options()

    expect_equivalent(Runuran.options("error.level")[[1L]], "warning")

    Runuran.options(error.level="none")
    expect_equivalent(Runuran.options("error.level")[[1L]], "none")

    Runuran.options(error.level="error")
    expect_equivalent(Runuran.options("error.level")[[1L]], "error")

    Runuran.options(error.level="warn")
    expect_equivalent(Runuran.options("error.level")[[1L]], "warning")

    Runuran.options(error.level="all")
    expect_equivalent(Runuran.options("error.level")[[1L]], "all")

    Runuran.options(error.level="default")
    expect_equivalent(Runuran.options("error.level")[[1L]], "warning")

    Runuran.options(old.opts)
})

## --------------------------------------------------------------------------

context("[Runuran.options] - Invalid arguments")

## --------------------------------------------------------------------------

test_that("[opts-i01] calling Runuran.options with invalid arguments", {

    ## invalid options
    msg <- mkmsg.e("Invalid argument '1'")
    expect_error( Runuran.options(1),  msg)

    msg <- mkmsg.e("Options must be given by name") 
    expect_error( Runuran.options(list(1)),  msg)

    msg <- mkmsg.e("Invalid option 'invalid'")
    expect_error( Runuran.options(invalid=1),  msg)

    ## invalid values for option "error.level"
    msg <- mkmsg.e("Invalid value for option 'error.level'. ",
                   "Possible values: \"default\", \"all\", \"warning\", \"error\", \"none\"")
    expect_error( Runuran.options(error.level="invalid"),  msg)
})

## --------------------------------------------------------------------------

## context("[Runuran.options] - Handling NA and NaNs")

## -- End -------------------------------------------------------------------
