library(StatMeasures)


### Name: decile
### Title: Create deciles of a variable
### Aliases: decile

### ** Examples

# Scores vector
scores <- c(1, 4, 7, 10, 15, 21, 25, 27, 32, 35,
            49, 60, 75, 23, 45, 86, 26, 38, 34, 67)

# Create deciles based on the values of the vector
decileScores <- decile(vector = scores)
decileScores <- decile(vector = scores, decreasing = TRUE)



