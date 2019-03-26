library(votesys)


### Name: star_rating
### Title: User Preference Aggregation
### Aliases: star_rating

### ** Examples

# Example from Langville and Meyer, 2012: 128. 
# 4 films are rated by 10 users; 0 means no score.
raw <- c(4, 3, 1, 2, 0, 2, 0, 3, 0, 2, 2, 1, 0, 4, 3, 3, 4, 
    1, 3, 0, 2, 0, 2, 2, 2, 0, 1, 1, 2, 2, 0, 2, 0, 0, 5, 0, 3, 
    0, 5, 4
)
m <- matrix(raw, ncol = 4)
colnames(m) <- paste("film", 1: 4, sep = "")
y <- star_rating(m, show_name = TRUE) # winner is film4



