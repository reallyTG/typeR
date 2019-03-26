library(mscsweblm4r)


### Name: weblmListAvailableModels
### Title: Retrieves the list of web language models available.
### Aliases: weblmListAvailableModels

### ** Examples

## Not run: 
##D  tryCatch({
##D 
##D    # Retrieve a list of supported web language models
##D    modelList <- weblmListAvailableModels()
##D 
##D    # Class and structure of modelList
##D    class(modelList)          # weblm
##D    #> [1] "weblm"
##D 
##D    str(modelList, max.level = 1)
##D    #> List of 3
##D    #>  $ results:'data.frame':  4 obs. of  7 variables:
##D    #>  $ json   : chr "{"models":[{"corpus":"bing webpage title text 2013-12", __truncated__ }]}
##D    #>  $ request:List of 7
##D    #>   ..- attr(*, "class")= chr "request"
##D    #>  - attr(*, "class")= chr "weblm"
##D 
##D    # Print partial results
##D    pandoc.table(modelList$results[1:3])
##D    #> -------------------------------------------------
##D    #>             corpus              model   maxOrder
##D    #> ------------------------------ ------- ----------
##D    #>    bing webpage title text      title      5
##D    #>            2013-12
##D    #>
##D    #> bing webpage body text 2013-12   body      5
##D    #>
##D    #>  bing web query text 2013-12    query      5
##D    #>
##D    #>    bing webpage anchor text    anchor      5
##D    #>            2013-12
##D    #> -------------------------------------------------
##D 
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



