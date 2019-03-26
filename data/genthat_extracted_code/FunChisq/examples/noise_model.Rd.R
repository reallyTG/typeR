library(FunChisq)


### Name: add.noise
### Title: Apply Noise to Discrete-Valued Tables
### Aliases: add.noise add.house.noise add.candle.noise
### Keywords: datagen

### ** Examples

  # Example 1. Add house noise to a single table

  # Create a 4x4 table
  t <- matrix(c(3,0,0,0,
                0,2,2,0,
                0,0,0,4,
                3,3,2,0),
              nrow=4, ncol=4, byrow=TRUE)
  # Two ways to apply house noise at level 0.1 along both rows
  # and columns of the table:
  add.noise(t, 0.1, "house", 0)
  add.house.noise(t, 0.1, 0)


  # Example 2. Add candle noise to a list of tables

  # Create a list of tables
  t.list <- list(t+5, t*10, t*2)
  # Two ways to apply candle noise at level 0.2 along the rows
  # of the table:
  add.noise(t.list, 0.2, "candle", 1)
  add.candle.noise(t.list, 0.2, 1)




