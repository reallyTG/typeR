library(postlogic)


### Name: unless-then
### Title: Infix unless-then logic
### Aliases: unless-then %unless% %then%

### ** Examples

    x <- 4
    x <- sqrt(x) %unless% is.complex(x) %then% "This is too hard :("
    x # 2

    x <- 4i
    x <- sqrt(x) %unless% is.complex(x) %then% "This is too hard :("
    x # This is too hard :(



