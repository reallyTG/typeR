library(xtable)


### Name: sanitize
### Title: Sanitization Functions
### Aliases: sanitize sanitize.numbers sanitize.final as.is as.math
### Keywords: print

### ** Examples

insane <- c("&",">", ">","_","%","$","\\","#","^","~","{","}")
names(insane) <- c("Ampersand","Greater than","Less than",
                   "Underscore","Percent","Dollar",
                   "Backslash","Hash","Caret","Tilde",
                   "Left brace","Right brace")
sanitize(insane, type = "latex")
insane <- c("&",">","<")
names(insane) <- c("Ampersand","Greater than","Less than")
sanitize(insane, type = "html")
x <- rnorm(10)
sanitize.numbers(x, "latex", TRUE)
sanitize.numbers(x*10^(10), "latex", TRUE, TRUE)
sanitize.numbers(x, "html", TRUE, TRUE)
as.is(insane)
as.math("x10^10", ": mathematical expression")



