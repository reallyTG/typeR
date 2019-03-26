library(mscsweblm4r)


### Name: weblmBreakIntoWords
### Title: Breaks a string of concatenated words into individual words
### Aliases: weblmBreakIntoWords

### ** Examples

## Not run: 
##D  tryCatch({
##D 
##D    # Break a sentence into words
##D    textWords <- weblmBreakIntoWords(
##D      textToBreak = "testforwordbreak", # ASCII only
##D      modelToUse = "body",              # "title"|"anchor"|"query"(default)|"body"
##D      orderOfNgram = 5L,                # 1L|2L|3L|4L|5L(default)
##D      maxNumOfCandidatesReturned = 5L   # Default: 5L
##D    )
##D 
##D    # Class and structure of textWords
##D    class(textWords)
##D    #> [1] "weblm"
##D 
##D    str(textWords, max.level = 1)
##D    #> List of 3
##D    #>  $ results:'data.frame':  5 obs. of  2 variables:
##D    #>  $ json   : chr "{"candidates":[{"words":"test for word break", __truncated__ }]}
##D    #>  $ request:List of 7
##D    #>   ..- attr(*, "class")= chr "request"
##D    #>  - attr(*, "class")= chr "weblm"
##D 
##D    # Print results
##D    pandoc.table(textWords$results)
##D    #> ---------------------------------
##D    #>       words          probability
##D    #> ------------------- -------------
##D    #> test for word break    -13.83
##D    #>
##D    #>  test for wordbreak    -14.63
##D    #>
##D    #>  testfor word break    -15.94
##D    #>
##D    #>  test forword break    -16.72
##D    #>
##D    #>   testfor wordbreak    -17.41
##D    #> ---------------------------------
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



