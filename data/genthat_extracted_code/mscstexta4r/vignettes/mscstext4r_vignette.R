## ----echo=FALSE----------------------------------------------------------
# Build with devtools::install(build_vignettes = TRUE)
library("knitr")
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ----eval=FALSE----------------------------------------------------------
#  if ("mscstexta4r" %in% installed.packages()[,"Package"] == FALSE) {
#    install.packages("mscstexta4r")
#  }

## ----eval=FALSE----------------------------------------------------------
#  if ("mscstexta4r" %in% installed.packages()[,"Package"] == FALSE) {
#    if ("devtools" %in% installed.packages()[,"Package"] == FALSE) {
#      install.packages("devtools")
#    }
#    devtools::install_github("philferriere/mscstexta4r")
#  }

## ------------------------------------------------------------------------
library('mscstexta4r')
tryCatch({

  textaInit()

}, error = function(err) {

  geterrmessage()

})

## ----eval=FALSE----------------------------------------------------------
#  [1] "mscstexta4r: could not load config info from Sys env nor from file"

## ----eval = FALSE--------------------------------------------------------
#  # Perform sentiment analysis
#  textaSentiment(
#    documents,                  # Input sentences or documents
#    languages = rep("en", length(documents))
#    # "en"(English, default)|"es"(Spanish)|"fr"(French)|"pt"(Portuguese)
#  )

## ----eval = FALSE--------------------------------------------------------
#  # Detect top topics in group of documents
#  textaDetectTopics(
#    documents,                  # At least 100 documents (English only)
#    stopWords = NULL,           # Stop word list (optional)
#    topicsToExclude = NULL,     # Topics to exclude (optional)
#    minDocumentsPerWord = NULL, # Threshold to exclude rare topics (optional)
#    maxDocumentsPerWord = NULL, # Threshold to exclude ubiquitous topics (optional)
#    resultsPollInterval = 30L,  # Poll interval (in s, default: 30s, use 0L for async)
#    resultsTimeout = 1200L,     # Give up timeout (in s, default: 1200s = 20mn)
#    verbose = FALSE             # If set to TRUE, print every poll status to stdout
#  )

## ----eval = FALSE--------------------------------------------------------
#  # Detect languages used in documents
#  textaDetectLanguages(
#    documents,                      # Input sentences or documents
#    numberOfLanguagesToDetect = 1L  # Default: 1L
#  )

## ----eval = FALSE--------------------------------------------------------
#    # Get key talking points in documents
#  textaKeyPhrases(
#    documents,                  # Input sentences or documents
#    languages = rep("en", length(documents))
#    # "en"(English, default)|"de"(German)|"es"(Spanish)|"fr"(French)|"ja"(Japanese)
#  )

## ------------------------------------------------------------------------
docsText <- c(
  "Loved the food, service and atmosphere! We'll definitely be back.",
  "Very good food, reasonable prices, excellent service.",
  "It was a great restaurant.",
  "If steak is what you want, this is the place.",
  "The atmosphere is pretty bad but the food is quite good.",
  "The food is quite good but the atmosphere is pretty bad.",
  "The food wasn't very good.",
  "I'm not sure I would come back to this restaurant.",
  "While the food was good the service was a disappointment.",
  "I was very disappointed with both the service and my entree."
)
docsLanguage <- rep("en", length(docsText))

tryCatch({

  # Perform sentiment analysis
  textaSentiment(
    documents = docsText,    # Input sentences or documents
    languages = docsLanguage
    # "en"(English, default)|"es"(Spanish)|"fr"(French)|"pt"(Portuguese)
)

}, error = function(err) {

  # Print error
  geterrmessage()

})

## ------------------------------------------------------------------------
# Load yelpChReviews100 text reviews
load("../tests/testthat/data/yelpChineseRestaurantReviews100.rda")

tryCatch({

  # Detect top topics
  textaDetectTopics(
    documents = yelpChReviews100, # At least 100 docs/sentences (English only)
    stopWords = NULL,             # Stop word list (optional)
    topicsToExclude = NULL,       # Topics to exclude (optional)
    minDocumentsPerWord = NULL,   # Threshold to exclude rare topics (optional)
    maxDocumentsPerWord = NULL,   # Threshold to exclude ubiquitous topics (optional)
    resultsPollInterval = 60L,    # Poll interval (in s, default: 30s, use 0L for async)
    resultsTimeout = 1200L,       # Give up timeout (in s, default: 1200s = 20mn)
    verbose = TRUE                # If set to TRUE, print every poll status to stdout
  )

}, error = function(err) {

  # Print error
  geterrmessage()

})

## ----eval = FALSE--------------------------------------------------------
#  # Load yelpChReviews100 text reviews
#  load("../tests/testthat/data/yelpChineseRestaurantReviews100.rda")
#  
#  tryCatch({
#  
#    # Detect top topics
#    operation <- textaDetectTopics(
#      documents = yelpChReviews100, # At least 100 docs/sentences (English only)
#      resultsPollInterval = 0L,     # Poll interval (in s, default: 30s, use 0L for async)
#      verbose = TRUE                # If set to TRUE, print every poll status to stdout
#    )
#  
#    # Poll the servers ourselves, until the work completes or until we time out
#    resultsPollInterval <- 60L
#    resultsTimeout <- 1200L
#    startTime <- Sys.time()
#    endTime <- startTime + resultsTimeout
#  
#    while (Sys.time() <= endTime) {
#      sleepTime <- startTime + resultsPollInterval - Sys.time()
#      if (sleepTime > 0)
#        Sys.sleep(sleepTime)
#      startTime <- Sys.time()
#  
#      # Poll for results
#      topics <- textaDetectTopicsStatus(operation, verbose = TRUE)
#      if (topics$status != "NotStarted" && topics$status != "Running")
#        break;
#    }
#  
#    topics
#  
#  }, error = function(err) {
#  
#    # Print error
#    geterrmessage()
#  
#  })
#  # Same results as in synchronous mode

## ------------------------------------------------------------------------
docsText = c(
  "The Louvre or the Louvre Museum is the world's largest museum.",
  "Le musee du Louvre est un musee d'art et d'antiquites situe au centre de Paris.",
  "El Museo del Louvre es el museo nacional de Francia.",
  "Il Museo del Louvre a Parigi, in Francia, e uno dei piu celebri musei del mondo.",
  "Der Louvre ist ein Museum in Paris."
)

tryCatch({

  # Detect languages
  textaDetectLanguages(
    documents = docsText,           # Input sentences or documents
    numberOfLanguagesToDetect = 1L  # Number of languages to detect
  )

}, error = function(err) {

  # Print error
  geterrmessage()

})

## ------------------------------------------------------------------------
docsText <- c(
  "Loved the food, service and atmosphere! We'll definitely be back.",
  "Very good food, reasonable prices, excellent service.",
  "It was a great restaurant.",
  "If steak is what you want, this is the place.",
  "The atmosphere is pretty bad but the food is quite good.",
  "The food is quite good but the atmosphere is pretty bad.",
  "I'm not sure I would come back to this restaurant.",
  "The food wasn't very good.",
  "While the food was good the service was a disappointment.",
  "I was very disappointed with both the service and my entree."
)
docsLanguage <- rep("en", length(docsText))

tryCatch({

  # Get key talking points in documents
  textaKeyPhrases(
    documents = docsText,    # Input sentences or documents
    languages = docsLanguage
    # "en"(English, default)|"de"(German)|"es"(Spanish)|"fr"(French)|"ja"(Japanese)
  )

}, error = function(err) {

  # Print error
  geterrmessage()

})

