library(mscstexta4r)


### Name: textaDetectLanguages
### Title: Detects the languages used in documents.
### Aliases: textaDetectLanguages

### ** Examples

## Not run: 
##D 
##D  docsText <- c(
##D    "The Louvre or the Louvre Museum is the world's largest museum.",
##D    "Le musee du Louvre est un musee d'art et d'antiquites situe au centre de Paris.",
##D    "El Museo del Louvre es el museo nacional de Francia.",
##D    "Il Museo del Louvre a Parigi, in Francia, e uno dei piu celebri musei del mondo.",
##D    "Der Louvre ist ein Museum in Paris."
##D  )
##D 
##D  tryCatch({
##D 
##D    # Detect languages used in documents
##D    docsLanguage <- textaDetectLanguages(
##D      documents = docsText,           # Input sentences or documents
##D      numberOfLanguagesToDetect = 1L  # Number of languages to detect
##D    )
##D 
##D    # Class and structure of docsLanguage
##D    class(docsLanguage)
##D    #> [1] "texta"
##D    str(docsLanguage, max.level = 1)
##D    #> List of 3
##D    #>  $ results:'data.frame': 5 obs. of  4 variables:
##D    #>  $ json   : chr "{\"documents\":[{\"id\":\"B6e4C\",\"detectedLanguages\": __truncated__ }]}
##D    #>  $ request:List of 7
##D    #>   ..- attr(*, "class")= chr "request"
##D    #>  - attr(*, "class")= chr "texta"
##D 
##D    # Print results
##D    docsLanguage
##D    #> texta [https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/lan __truncated__ ]
##D    #>
##D    #> -----------------------------------------------------------
##D    #>             text               name    iso6391Name   score
##D    #> ----------------------------- ------- ------------- -------
##D    #>   The Louvre or the Louvre    English      en          1
##D    #> Museum is the world's largest
##D    #>            museum.
##D    #>
##D    #>   Le musee du Louvre est un    French      fr          1
##D    #>  musee d'art et d'antiquites
##D    #>   situe au centre de Paris.
##D    #>
##D    #>   El Museo del Louvre es el   Spanish      es          1
##D    #>  museo nacional de Francia.
##D    #>
##D    #> Il Museo del Louvre a Parigi, Italian      it          1
##D    #>   in Francia, e uno dei piu
##D    #>   celebri musei del mondo.
##D    #>
##D    #>  Der Louvre ist ein Museum in  German      de          1
##D    #>            Paris.
##D    #> -----------------------------------------------------------
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



