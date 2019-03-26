library(mscsweblm4r)


### Name: weblmCalculateConditionalProbability
### Title: Calculates the conditional probability that a word follows a
###   sequence of words.
### Aliases: weblmCalculateConditionalProbability

### ** Examples

## Not run: 
##D  tryCatch({
##D 
##D    # Calculate conditional probability a particular word will follow a given sequence of words
##D    conditionalProbabilities <- weblmCalculateConditionalProbability(
##D      precedingWords = "hello world wide",       # ASCII only
##D      continuations = c("web", "range", "open"), # ASCII only
##D      modelToUse = "title",                      # "title"|"anchor"|"query"(default)|"body"
##D      orderOfNgram = 4L                          # 1L|2L|3L|4L|5L(default)
##D    )
##D 
##D    # Class and structure of conditionalProbabilities
##D    class(conditionalProbabilities)
##D    #> [1] "weblm"
##D 
##D    str(conditionalProbabilities, max.level = 1)
##D    #> List of 3
##D    #>  $ results:'data.frame':  3 obs. of  3 variables:
##D    #>  $ json   : chr "{"results":[{"words":"hello world wide","word":"web", __truncated__ }]}
##D    #>  $ request:List of 7
##D    #>   ..- attr(*, "class")= chr "request"
##D    #>  - attr(*, "class")= chr "weblm"
##D 
##D    # Print results
##D    pandoc.table(conditionalProbabilities$results)
##D    #> -------------------------------------
##D    #>      words        word   probability
##D    #> ---------------- ------ -------------
##D    #> hello world wide   web      -0.32
##D    #>
##D    #> hello world wide range     -2.403
##D    #>
##D    #> hello world wide  open      -2.97
##D    #> -------------------------------------
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



