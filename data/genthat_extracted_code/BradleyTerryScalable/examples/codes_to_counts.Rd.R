library(BradleyTerryScalable)


### Name: codes_to_counts
### Title: Converts data frame with a code for wins to counts of wins
### Aliases: codes_to_counts

### ** Examples

first <- c("A", "A", "B", "A")
second <- c("B", "B", "C", "C")
df1 <- data.frame(player1 = first, player2 = second, code = c("W1", "W2", "D", "D"))
codes_to_counts(df1, c("W1", "W2", "D"))
df2 <- data.frame(item1 = first, item2 = second, result = c(0, 1, 1, .5))
codes_to_counts(df2, c(1, 0, .5))
df3 <- data.frame(player1 = first, player2 = second, which_won = c(1,2,2,1))
codes_to_counts(df3, c(1,2))
codes_to_counts(BradleyTerryScalable::toy_data, c("W1", "W2", "D"))



