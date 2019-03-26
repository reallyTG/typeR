library(rjade)


### Name: jade_compile
### Title: Render Jade Template
### Aliases: jade jade_compile jade_render

### ** Examples

# Example from http://jade-lang.com
text <- readLines(system.file("examples/test.jade", package = "rjade"))

# Compile and render seperately
tpl <- jade_compile(text, pretty = TRUE)
tpl()
tpl(youAreUsingJade = TRUE)

# Slightly faster for one-time rendering
jade_render(text, pretty = TRUE)
jade_render(text, pretty = TRUE, locals = list(youAreUsingJade = TRUE))



