library(textclean)


### Name: replace_rating
### Title: Replace Ratings With Words
### Aliases: replace_rating
### Keywords: rating

### ** Examples

x <- c("This place receives 5 stars for their APPETIZERS!!!",
     "Four stars for the food & the guy in the blue shirt for his great vibe!",
     "10 out of 10 for both the movie and trilogy.",
     "* Both the Hot & Sour & the Egg Flower Soups were absolutely 5 Stars!",
     "For service, I give them no stars.", "This place deserves no stars.",
     "10 out of 10 stars.",
     "My rating: just 3 out of 10.",
     "If there were zero stars I would give it zero stars.",
     "Rating: 1 out of 10.",
     "I gave it 5 stars because of the sound quality.",
     "If it were possible to give them 0/10, they'd have it."
)

replace_rating(x)



