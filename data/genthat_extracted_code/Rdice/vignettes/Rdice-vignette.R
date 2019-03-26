## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eval = FALSE--------------------------------------------------------
#  set.seed(1902)
#  dice.roll(faces = 6, dice = 2, rolls = 5)$results
#     die_1 die_2
#  1:     6     1
#  2:     1     5
#  3:     6     5
#  4:     6     1
#  5:     6     5

## ----eval = FALSE--------------------------------------------------------
#  set.seed(1902)
#  dice.roll(faces = 6, dice = 2, rolls = 5)$frequencies
#     die_1 die_2 N freq
#  1:     6     1 2  0.4
#  2:     1     5 1  0.2
#  3:     6     5 2  0.4

## ----eval = FALSE--------------------------------------------------------
#  set.seed(1902)
#  dice.roll(faces = 6, dice = 2, rolls = 5)$sums_freq
#     sum N freq cum_sum
#  1:   6 1  0.2     0.2
#  2:   7 2  0.4     0.6
#  3:  11 2  0.4     1.0

## ----eval = FALSE--------------------------------------------------------
#  set.seed(1902)
#  dice.roll(faces = 6, dice = 2, rolls = 5)$exp_value_sum
#  [1] 8.4

## ----eval = FALSE--------------------------------------------------------
#  set.seed(1987)
#  dice.combinations(faces = 6, dice = 3, rolls = 1000,
#                    getExact = c(1,4), getPartial = c(5,6))
#     value_1 value_2 value_3  freq
#  1:       1       4       5 0.018
#  2:       1       4       6 0.027

## ----eval = FALSE--------------------------------------------------------
#  set.seed(1987)
#  dice.combinations(faces = 6, dice = 3, rolls = 1000,
#                    getExact = c(1,4), getPartial = c(5,6), toSum = TRUE)
#  [1] 0.052

## ----eval = FALSE--------------------------------------------------------
#  set.seed(1902)
#  coin.flip(coins = 5, flips = 10000, getExact = replicate(5, c("H")))
#     value_1 value_2 value_3 value_4 value_5   freq
#  1:       H       H       H       H       H 0.0311

## ----echo=FALSE----------------------------------------------------------
library(data.table)

# checks if the first die wins the second
is.winner <- function(first, second, prob, error){
  comb <- as.data.table(expand.grid(first, second))
  comb$winner <- ifelse(comb$Var1 > comb$Var2, "first", "second")
  results <- comb[, .N, by = winner][, freq:= N/sum(N)]
  if(!missing(prob)){
    return(results[winner == "first", freq > prob-abs(error) && freq<prob+abs(error)])
  } else {
    return(length(results[winner == "first", freq]) > 0 && results[winner == "first", freq] > results[winner == "second", freq])
  }
}

# checks if Efron
is.nonTransitive <- function(df, prob){
  truth <- vector(mode="logical", length=0)
  for(j in 1:(dim(df)[2]-1)){
    truth <- cbind(truth, is.winner(df[,j], df[,j+1], prob = prob, error = 0.001))
  }
  truth <- cbind(truth, is.winner(df[,dim(df)[2]], df[,1], prob = prob, error = 0.001))
  return(all(truth))
}

## ----echo=TRUE-----------------------------------------------------------
# generates a data frame of dice
df <- data.frame(
  die1 = c(5,4,6,15),
  die2 = c(3,6,16,2),
  die3 = c(0,2,14,15),
  die4 = c(8,10,1,9))
df

is.nonTransitive(df, prob = 9/16)

## ----echo=TRUE-----------------------------------------------------------
# generates a data frame of dice
df <- data.frame(
  die1 = c(5,14,0,14),
  die2 = c(7,10,4,13),
  die3 = c(12,9,2,8),
  die4 = c(1,7,16,8))
df

is.nonTransitive(df)

## ----eval=FALSE----------------------------------------------------------
#  set.seed(1902)
#  nonTransitive.generator(faces = 3, dice = 3, max_value = 9, prob = 5/9)
#  
#     die_1 die_2 die_3
#  1:     4     3     8
#  2:     6     2     5
#  3:     3     9     0

## ----eval=FALSE----------------------------------------------------------
#  nonTransitive.generator(4,4)
#     die_1 die_2 die_3 die_4
#  1:     5     7    12     1
#  2:    14    10     9     7
#  3:     0     4     2    16
#  4:    14    13     8     8

## ----eval= FALSE---------------------------------------------------------
#  data(efron)
#     die1 die2 die3 die4
#  1:    0    3    2    1
#  2:    0    3    2    1
#  3:    4    3    2    1
#  4:    4    3    2    5
#  5:    4    3    6    5
#  6:    4    3    6    5
#  
#  data(oskar)
#     die1 die2 die3 die4 die5 die6
#  1:    2    7    5    1    6    4
#  2:    2    7    5    1    6    4
#  3:   14   10   13   12    8   11
#  4:   14   10   13   12    8   11
#  5:   17   16   15   20   19   18
#  6:   17   16   15   20   19   18
#  
#  data(miwin)
#     die1 die2 die3
#  1:    1    1    2
#  2:    2    3    3
#  3:    5    4    4
#  4:    6    5    6
#  5:    7    8    7
#  6:    9    9    8

