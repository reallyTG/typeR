library(mscstexta4r)


### Name: textaSentiment
### Title: Assesses the sentiment of sentences or documents.
### Aliases: textaSentiment

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
##D    # Perform sentiment analysis
##D    docsSentiment <- textaSentiment(
##D      documents = docsText,    # Input sentences or documents
##D      languages = docsLanguage
##D      # "en"(English, default)|"es"(Spanish)|"fr"(French)|"pt"(Portuguese)
##D    )
##D 
##D    # Class and structure of docsSentiment
##D    class(docsSentiment)
##D    #> [1] "texta"
##D    str(docsSentiment, max.level = 1)
##D    #> List of 3
##D    #>  $ results:'data.frame': 10 obs. of  2 variables:
##D    #>  $ json   : chr "{\"documents\":[{\"score\":0.9903013,\"id\":\"hDgKc\", __truncated__ }]}
##D    #>  $ request:List of 7
##D    #>   ..- attr(*, "class")= chr "request"
##D    #>  - attr(*, "class")= chr "texta"
##D 
##D    # Print results
##D    docsSentiment
##D    #> texta [https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment]
##D    #>
##D    #> --------------------------------------
##D    #>              text               score
##D    #> ------------------------------ -------
##D    #>  Loved the food, service and    0.9847
##D    #>  atmosphere! We'll definitely
##D    #>            be back.
##D    #>
##D    #>  Very good food, reasonable     0.9831
##D    #>  prices, excellent service.
##D    #>
##D    #>  It was a great restaurant.     0.9306
##D    #>
##D    #>  If steak is what you want,     0.8014
##D    #>      this is the place.
##D    #>
##D    #> The atmosphere is pretty bad    0.4998
##D    #>  but the food is quite good.
##D    #>
##D    #> The food is quite good but the   0.475
##D    #>   atmosphere is pretty bad.
##D    #>
##D    #> I'm not sure I would come back  0.2857
##D    #>      to this restaurant.
##D    #>
##D    #>   The food wasn't very good.    0.1877
##D    #>
##D    #>  While the food was good the   0.08727
##D    #> service was a disappointment.
##D    #>
##D    #>  I was very disappointed with  0.01877
##D    #>    both the service and my
##D    #>            entree.
##D    #> --------------------------------------
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



