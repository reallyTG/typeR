library(QLearning)


### Name: qlearningaction
### Title: qlearningaction
### Aliases: qlearningaction
### Keywords: reinforcementlearning machinelearning optimize

### ** Examples


cardgame <- function()
{
  playercards <- sample(1:8,4) #distribute the cards, we're player one
  ourcard <- playercards[1] #our card
  playertotals <- rep(-1,4) #including the antes
  playersinpot <- vector()
  for (player in 2:4) #other 3 players go first
  {
    if (playercards[player]>=2)
    {
      playertotals[player] <- (-3)
      playersinpot <- append(playersinpot,player)
    }
  }
  #the next line is where we want to choose our action
  player1 <- 'Choose'
  if (player1=="Call")
  {
    playertotals[1] <- (-3)
    playersinpot <- append(playersinpot,1)
  }
  potsize <- -1*(sum(playertotals)) #the amount in the pot is how much the players put in
  playercards[!(1:4 %in% playersinpot)] <- 0 #get rid of everyone who folded
  winner <- which.max(playercards) #winner is the person with the highest card who didn't fold
  playertotals[winner] <- playertotals[winner]+potsize
  return(playertotals[1]) #return how much we won
}

strat <- qlearn(game="cardgame",statevars="ourcard",possibleactions=c("Call","Fold"),
  playername="player1",numiter=25000) #make sure each function and variable name is a string

qlearningaction(strat,3,exploration=.75)
#Pick an action to perform when we have the 3 card, with high exploration



