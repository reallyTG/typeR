library(sentimentr)


### Name: validate_sentiment
### Title: Validate Sentiment Score Sign Against Known Results
### Aliases: validate_sentiment

### ** Examples

actual <- c(1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, 1,-1)
predicted <- c(1, 0, 1, -1, 1, 0, -1, -1, -1, -1, 0, 1,-1)
validate_sentiment(predicted, actual)

scores <- hu_liu_cannon_reviews$sentiment
mod <- sentiment_by(get_sentences(hu_liu_cannon_reviews$text))

validate_sentiment(mod$ave_sentiment, scores)
validate_sentiment(mod, scores)

x <- validate_sentiment(mod, scores)
attributes(x)$confusion_matrix
attributes(x)$class_confusion_matrices
attributes(x)$macro_stats

## Annie Swafford Example
swafford <- data.frame(
    text = c(
        "I haven't been sad in a long time.",
        "I am extremely happy today.",
        "It's a good day.",
        "But suddenly I'm only a little bit happy.",
        "Then I'm not happy at all.",
        "In fact, I am now the least happy person on the planet.",
        "There is no happiness left in me.",
        "Wait, it's returned!",
        "I don't feel so bad after all!"
    ), 
    actual = c(.8, 1, .8, -.1, -.5, -1, -1, .5, .6), 
    stringsAsFactors = FALSE
)

pred <- sentiment_by(swafford$text) 
validate_sentiment(
    pred,
    actual = swafford$actual
)



