library(inlmisc)


### Name: ReplaceInTemplate
### Title: Replace Values in a Template Text
### Aliases: ReplaceInTemplate
### Keywords: IO

### ** Examples

text <- c("Hello $(name)!", "$(a) + $(b) = @{$(a) + $(b)}",
          "pi = @{format(pi, digits = 5)}")
cat(text, sep = "\n")
replacement <- list(name = "world", a = 1, b = 2)
cat(ReplaceInTemplate(text, replacement), sep = "\n")




