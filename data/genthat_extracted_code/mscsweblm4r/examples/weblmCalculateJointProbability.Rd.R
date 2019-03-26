library(mscsweblm4r)


### Name: weblmCalculateJointProbability
### Title: Calculates the joint probability that a sequence of words will
###   appear together.
### Aliases: weblmCalculateJointProbability

### ** Examples

## Not run: 
##D  tryCatch({
##D 
##D    # Calculate joint probability a particular sequence of words will appear together
##D    jointProbabilities <- weblmCalculateJointProbability(
##D      inputWords = c("where", "is", "San", "Francisco", "where is",
##D                     "San Francisco", "where is San Francisco"),  # ASCII only
##D      modelToUse = "query",                     # "title"|"anchor"|"query"(default)|"body"
##D      orderOfNgram = 4L                         # 1L|2L|3L|4L|5L(default)
##D    )
##D 
##D    # Class and structure of jointProbabilities
##D    class(jointProbabilities)
##D    #> [1] "weblm"
##D 
##D    str(jointProbabilities, max.level = 1)
##D    #> List of 3
##D    #>  $ results:'data.frame':  7 obs. of  2 variables:
##D    #>  $ json   : chr "{"results":[{"words":"where","probability":-3.378}, __truncated__ ]}
##D    #>  $ request:List of 7
##D    #>   ..- attr(*, "class")= chr "request"
##D    #>  - attr(*, "class")= chr "weblm"
##D 
##D    # Print results
##D    pandoc.table(jointProbabilities$results)
##D    #> ------------------------------------
##D    #>         words           probability
##D    #> ---------------------- -------------
##D    #>         where             -3.378
##D    #>
##D    #>           is              -2.607
##D    #>
##D    #>          san              -3.292
##D    #>
##D    #>       francisco           -4.051
##D    #>
##D    #>        where is           -3.961
##D    #>
##D    #>     san francisco         -4.086
##D    #>
##D    #> where is san francisco    -7.998
##D    #> ------------------------------------
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



