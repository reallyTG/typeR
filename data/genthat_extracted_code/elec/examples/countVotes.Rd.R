library(elec)


### Name: countVotes
### Title: countVotes
### Aliases: countVotes

### ** Examples

  Z = make.cartoon()
  ## Take away 20 percent of C1's votes.
  Z$V$C1 = Z$V$C1 * 0.8
  ## Count again to find winner.
  Z = countVotes(Z)
  Z



