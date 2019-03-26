library(StatMeasures)


### Name: pentile
### Title: Create pentiles of a variable
### Aliases: pentile

### ** Examples

# Scores vector
scores <- c(1, 4, 7, 10, 15, 21, 25, 27, 32, 35,
            49, 60, 75, 23, 45, 86, 26, 38, 34, 67)

# Create pentiles based on the values of the vector
pentileScores <- pentile(vector = scores)
pentileScores <- pentile(vector = scores, decreasing = TRUE)



