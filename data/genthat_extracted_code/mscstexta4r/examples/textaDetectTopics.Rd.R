library(mscstexta4r)


### Name: textaDetectTopics
### Title: Detects the top topics in a group of text documents.
### Aliases: textaDetectTopics

### ** Examples

## Not run: 
##D  load("./data/yelpChineseRestaurantReviews.rda")
##D  set.seed(1234)
##D  documents <- sample(yelpChReviews$text, 1000)
##D 
##D  tryCatch({
##D 
##D    # Detect top topics in group of documents
##D    topics <- textaDetectTopics(
##D      documents,                  # At least 100 documents (English only)
##D      stopWords = NULL,           # Stop word list (optional)
##D      topicsToExclude = NULL,     # Topics to exclude (optional)
##D      minDocumentsPerWord = NULL, # Threshold to exclude rare topics (optional)
##D      maxDocumentsPerWord = NULL, # Threshold to exclude ubiquitous topics (optional)
##D      resultsPollInterval = 30L,  # Poll interval (in s, default:30s, use 0L for async)
##D      resultsTimeout = 1200L,     # Give up timeout (in s, default: 1200s = 20mn)
##D      verbose = TRUE              # If set to TRUE, print every poll status to stdout
##D    )
##D 
##D    # Class and structure of topics
##D    class(topics)
##D    #> [1] "textatopics"
##D 
##D    str(topics, max.level = 1)
##D    #> List of 8
##D    #> $ status          : chr "Succeeded"
##D    #> $ operationId     : chr "30334a3e1e28406a80566bb76ff04884"
##D    #> $ operationType   : chr "topics"
##D    #> $ documents       :'data.frame':  1000 obs. of  2 variables:
##D    #> $ topics          :'data.frame':  71 obs. of  3 variables:
##D    #> $ topicAssignments:'data.frame':  502 obs. of  3 variables:
##D    #> $ json            : chr "{\"status\":\"Succeeded\",\"createdDateTime\": __truncated__ }
##D    #> $ request         :List of 7
##D    #> ..- attr(*, "class")= chr "request"
##D    #> - attr(*, "class")= chr "textatopics"
##D 
##D    # Print results
##D    topics
##D    #> textatopics [https://westus.api.cognitive.microsoft.com/text/analytics/ __truncated__ ]
##D    #> status: Succeeded
##D    #> operationId: 30334a3e1e28406a80566bb76ff04884
##D    #> operationType: topics
##D    #> topics (first 20):
##D    #> ------------------------
##D    #>    keyPhrase      score
##D    #> ---------------- -------
##D    #>     portions       35
##D    #>   noodle soup      30
##D    #>    vegetables      20
##D    #>       tofu         19
##D    #>      garlic        17
##D    #>     Eggplant       15
##D    #>       Pad          15
##D    #>      combo         13
##D    #> Beef Noodle Soup   13
##D    #>      House         12
##D    #>      entree        12
##D    #>     wontons        12
##D    #>     Pei Wei        12
##D    #>  mongolian beef    11
##D    #>       crab         11
##D    #>      Panda         11
##D    #>       bean         10
##D    #>    dumplings        9
##D    #>     veggies         9
##D    #>      decor          9
##D    #> ------------------------
##D 
##D  }, error = function(err) {
##D 
##D    # Print error
##D    geterrmessage()
##D 
##D  })
## End(Not run)



