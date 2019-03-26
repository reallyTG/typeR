library(sentimentr)


### Name: get_sentences
### Title: Get Sentences
### Aliases: get_sentences

### ** Examples

dat <- data.frame(
    w = c('Person 1', 'Person 2'),
    x = c(paste0(
        "Mr. Brown comes! He says hello. i give him coffee.  i will ",
        "go at 5 p. m. eastern time.  Or somewhere in between!go there"
    ), "One more thought for the road! I am going now.  Good day."),
    y = state.name[c(32, 38)], 
    z = c(.456, .124),
    stringsAsFactors = FALSE
)
get_sentences(dat$x)
get_sentences(dat)



