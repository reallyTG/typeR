library(tcltk2)


### Name: setLanguage
### Title: Change or get the language used in R and Tcl/Tk
### Aliases: setLanguage getLanguage
### Keywords: utilities

### ** Examples

## Determine which language is currently in use in R
oldlang <- getLanguage()
if (oldlang != "") {
    ## Switch to English and test a command that issues a warning
    if (setLanguage("en_US")) 1:3 + 1:2
    ## Switch to French and test a command that issues a warning
    if (setLanguage("fr_FR")) 1:3 + 1:2
    ## Switch to German and test a command that issues a warning
    if (setLanguage("de_DE")) 1:3 + 1:2
    ## Switch to Italian and test a command that issues a warning
    if (setLanguage("it_IT")) 1:3 + 1:2
    ## Etc..

    ## Restore previous language
    setLanguage(oldlang)
}



