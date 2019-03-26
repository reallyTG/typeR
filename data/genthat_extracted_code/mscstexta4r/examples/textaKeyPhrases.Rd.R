library(mscstexta4r)


### Name: textaKeyPhrases
### Title: Returns the key talking points in sentences or documents.
### Aliases: textaKeyPhrases

### ** Examples

## Not run: 
##D 
##D  docsText <- c(
##D    "Loved the food, service and atmosphere! We'll definitely be back.",
##D    "Very good food, reasonable prices, excellent service.",
##D    "It was a great restaurant.",
##D    "If steak is what you want, this is the place.",
##D    "The atmosphere is pretty bad but the food is quite good.",
##D    "The food is quite good but the atmosphere is pretty bad.",
##D    "I'm not sure I would come back to this restaurant.",
##D    "The food wasn't very good.",
##D    "While the food was good the service was a disappointment.",
##D    "I was very disappointed with both the service and my entree."
##D  )
##D  docsLanguage <- rep("en", length(docsText))
##D 
##D  tryCatch({
##D 
##D    # Get key talking points in documents
##D    docsKeyPhrases <- textaKeyPhrases(
##D      documents = docsText,    # Input sentences or documents
##D      languages = docsLanguage
##D      # "en"(English, default)|"de"(German)|"es"(Spanish)|"fr"(French)|"ja"(Japanese)
##D    )
##D 
##D    # Class and structure of docsKeyPhrases
##D    class(docsKeyPhrases)
##D    #> [1] "texta"
##D    str(docsKeyPhrases, max.level = 1)
##D    #> List of 3
##D    #>  $ results:'data.frame': 10 obs. of  2 variables:
##D    #>  $ json   : chr "{\"documents\":[{\"keyPhrases\":[\"atmosphere\",\"food\", __truncated__ ]}]}
##D    #>  $ request:List of 7
##D    #>   ..- attr(*, "class")= chr "request"
##D    #>  - attr(*, "class")= chr "texta"
##D 
##D    # Print results
##D    docsKeyPhrases
##D    #> texta [https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/keyPhrases]
##D    #>
##D    #> -----------------------------------------------------------
##D    #>              text                       keyPhrases
##D    #> ------------------------------ ----------------------------
##D    #>  Loved the food, service and    atmosphere, food, service
##D    #>  atmosphere! We'll definitely
##D    #>            be back.
##D    #>
##D    #>   Very good food, reasonable   reasonable prices, good food
##D    #>   prices, excellent service.
##D    #>
##D    #>   It was a great restaurant.         great restaurant
##D    #>
##D    #>   If steak is what you want,           steak, place
##D    #>       this is the place.
##D    #>
##D    #>  The atmosphere is pretty bad        atmosphere, food
##D    #>  but the food is quite good.
##D    #>
##D    #>  The food is quite good but the       food, atmosphere
##D    #>   atmosphere is pretty bad.
##D    #>
##D    #> I'm not sure I would come back          restaurant
##D    #>      to this restaurant.
##D    #>
##D    #>   The food wasn't very good.               food
##D    #>
##D    #>  While the food was good the          service, food
##D    #> service was a disappointment.
##D    #>
##D    #>  I was very disappointed with        service, entree
##D    #>    both the service and my
##D    #>            entree.
##D    #> -----------------------------------------------------------
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



