library(reprex)


### Name: reprex
### Title: Render a reprex
### Aliases: reprex

### ** Examples

## Not run: 
##D # put some code like this on the clipboard
##D # (y <- 1:4)
##D # mean(y)
##D reprex()
##D 
##D # provide code as an expression
##D reprex(rbinom(3, size = 10, prob = 0.5))
##D reprex({y <- 1:4; mean(y)})
##D 
##D # note that you can include newlines in those brackets
##D # in fact, that is probably a good idea
##D reprex({
##D   x <- 1:4
##D   y <- 2:5
##D   x + y
##D })
##D 
##D ## provide code via character vector
##D reprex(input = c("x <- 1:4", "y <- 2:5", "x + y"))
##D 
##D ## if just one line, terminate with '\n'
##D reprex(input = "rnorm(3)\n")
##D 
##D ## customize the output comment prefix
##D reprex(rbinom(3, size = 10, prob = 0.5), comment = "#;-)")
##D 
##D # override a default chunk option, in general
##D reprex({(y <- 1:4); median(y)}, opts_chunk = list(collapse = FALSE))
##D # the above is simply shorthand for this and produces same result
##D reprex({
##D   #+ setup, include = FALSE
##D   knitr::opts_chunk$set(collapse = FALSE)
##D 
##D   #+ actual-reprex-code
##D   (y <- 1:4)
##D   median(y)
##D })
##D 
##D # add prose, use general markdown formatting
##D reprex({
##D   #' # A Big Heading
##D   #'
##D   #' Look at my cute example. I love the
##D   #' [reprex](https://github.com/jennybc/reprex#readme) package!
##D   y <- 1:4
##D   mean(y)
##D })
##D 
##D # read reprex from file
##D writeLines(c("x <- 1:4", "mean(x)"), "foofy.R")
##D reprex(input = "foofy.R")
##D 
##D # read from file and write to similarly-named outfiles
##D reprex(input = "foofy.R", outfile = NA)
##D list.files(pattern = "foofy")
##D file.remove(list.files(pattern = "foofy"))
##D 
##D # write rendered reprex to file
##D reprex({
##D   x <- 1:4
##D   y <- 2:5
##D   x + y
##D }, outfile = "foofy")
##D list.files(pattern = "foofy")
##D file.remove(list.files(pattern = "foofy"))
##D 
##D # write reprex to file AND keep figure local too, i.e. don't post to imgur
##D reprex({
##D   #' Some prose
##D   ## regular comment
##D   (x <- 1:4)
##D   median(x)
##D   plot(x)
##D   }, outfile = "blarg", opts_knit = list(upload.fun = identity))
##D list.files(pattern = "blarg")
##D unlink(list.files(pattern = "blarg"), recursive = TRUE)
##D 
##D ## target venue = StackOverflow
##D ## http://stackoverflow.com/editing-help
##D ret <- reprex({
##D   x <- 1:4
##D   y <- 2:5
##D   x + y
##D }, venue = "so")
##D ret
##D 
##D ## target venue = R, also good for email or Slack snippets
##D ret <- reprex({
##D   x <- 1:4
##D   y <- 2:5
##D   x + y
##D }, venue = "R")
##D ret
##D 
##D ## include prompt and don't comment the output
##D ## use this when you want to make your code hard to execute :)
##D reprex({
##D   x <- 1:4
##D   y <- 2:5
##D   x + y
##D }, opts_chunk = list(comment = NA, prompt = TRUE))
##D 
##D ## leading prompts are stripped from source
##D reprex(input = c("> x <- 1:3", "> median(x)"))
## End(Not run)




