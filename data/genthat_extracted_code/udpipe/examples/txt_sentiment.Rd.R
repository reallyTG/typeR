library(udpipe)


### Name: txt_sentiment
### Title: Perform dictionary-based sentiment analysis on a tokenised data
###   frame
### Aliases: txt_sentiment

### ** Examples

model <- udpipe_download_model(language = "english-gum", 
                               model_dir = tempdir())
x <- c("I do not like whatsoever when an R package has soo many dependencies.",
       "Making other people install java is annoying, 
        as it is a really painful experience in classrooms.")
x <- udpipe(x, model)
scores <- txt_sentiment(x = x, 
              term = "lemma",
              polarity_terms = data.frame(term = c("annoy", "like", "painful"), 
                                          polarity = c(-1, 1, -1)), 
              polarity_negators = c("not", "neither"),
              polarity_amplifiers = c("pretty", "many", "really", "whatsoever"), 
              polarity_deamplifiers = c("slightly", "somewhat"))
scores$overall
scores$data
scores <- txt_sentiment(x = x, 
              term = "lemma",
              polarity_terms = data.frame(term = c("annoy", "like", "painful"), 
                                          polarity = c(-1, 1, -1)), 
              polarity_negators = c("not", "neither"),
              polarity_amplifiers = c("pretty", "many", "really", "whatsoever"), 
              polarity_deamplifiers = c("slightly", "somewhat"),
              constrain = TRUE, n_before = 4,
              n_after = 2, amplifier_weight = .8)
scores$overall
scores$data

## cleanup for CRAN
file.remove(model$file_model)



