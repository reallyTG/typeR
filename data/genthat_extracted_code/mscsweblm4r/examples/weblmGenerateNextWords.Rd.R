library(mscsweblm4r)


### Name: weblmGenerateNextWords
### Title: Returns the words most likely to follow a sequence of words.
### Aliases: weblmGenerateNextWords

### ** Examples

## Not run: 
##D  tryCatch({
##D 
##D    # Generate next words
##D    wordCandidates <- weblmGenerateNextWords(
##D      precedingWords = "how are you",  # ASCII only
##D      modelToUse = "title",            # "title"|"anchor"|"query"(default)|"body"
##D      orderOfNgram = 4L,               # 1L|2L|3L|4L|5L(default)
##D      maxNumOfCandidatesReturned = 5L  # Default: 5L
##D    )
##D 
##D    # Class and structure of wordCandidates
##D    class(wordCandidates)
##D    #> [1] "weblm"
##D 
##D    str(wordCandidates, max.level = 1)
##D    #> List of 3
##D    #>  $ results:'data.frame':  5 obs. of  2 variables:
##D    #>  $ json   : chr "{"candidates":[{"word":"doing","probability":-1.105}, __truncated__ ]}
##D    #>  $ request:List of 7
##D    #>   ..- attr(*, "class")= chr "request"
##D    #>  - attr(*, "class")= chr "weblm"
##D 
##D    # Print results
##D    pandoc.table(wordCandidates$results)
##D    #> ---------------------
##D    #>   word    probability
##D    #> ------- -------------
##D    #>   doing     -1.105
##D    #>
##D    #>    in       -1.239
##D    #>
##D    #> feeling     -1.249
##D    #>
##D    #>   going     -1.378
##D    #>
##D    #>   today      -1.43
##D    #> ---------------------
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



