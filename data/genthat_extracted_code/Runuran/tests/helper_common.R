
## --- create message string for expect_error(), ... calls

## .Runuran.stop()
makemsg.e <- function(funct,...) {
    paste0("^(Error\\s*:)?\\s*", funct,"\\(.*\\)\\s*:\\n\\s+", ...,"\\.(\\n)?$")
}

## warning()
makemsg.w <- function(funct,...) {
    paste0("^", funct,"\\(.*\\)\\s*:\\n\\s+", ...,"\\.$")
}

## message()
makemsg.m <- function(funct,...) {
    paste0("^", funct,"\\(.*\\)\\s*:\\n\\s+", ...,"\\.\\n$")
}

## --- skip test on windows and unix, respectivel
skip_on_windows <- function() {
    if (.Platform$OS.type != "unix") skip("Windows")
}

skip_on_unix <- function() {
    if (.Platform$OS.type == "unix") skip("Unix")
}

## --- end ------------------------------------------------------------------
