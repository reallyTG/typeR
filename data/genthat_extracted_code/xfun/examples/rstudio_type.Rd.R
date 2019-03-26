library(xfun)


### Name: rstudio_type
### Title: Type a character vector into the RStudio source editor
### Aliases: rstudio_type

### ** Examples

library(xfun)
if (loadable("rstudioapi") && rstudioapi::isAvailable()) {
    rstudio_type("Hello, RStudio! xfun::rstudio_type() looks pretty cool!", 
        pause = function() runif(1, 0, 0.5), mistake = 0.1)
}



