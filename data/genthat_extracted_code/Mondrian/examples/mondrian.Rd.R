library(Mondrian)


### Name: mondrian
### Title: Computes and displays the relative occurrence and co-occurence
###   of events
### Aliases: mondrian
### Keywords: dplot hplot

### ** Examples

  data(endosymbiont_1pop)
  out1 <- mondrian(endosymbiont_1pop)
  out1
  
  ## 110 011 010 
  ## 0.6 0.2 0.2
  
  
  data(endosymbiont_3pop)
  out2 <- mondrian(endosymbiont_3pop, pop = 1)
  out2
  
  ## $AlxT
  ## 01100 
  ##        1 
  ## $MalD
  ## 10111 10011 01101 00100
  ##   0.1   0.1   0.1   0.7 
  ## $MslCh
  ## 10111 10011 10010 10001 00110 00010
  ##   0.1   0.1   0.4   0.1   0.1   0.2 
  ## $pop
  ##      10111      10011      10010      10001      01101      01100 
  ## 0.06666667 0.06666667 0.13333333 0.03333333 0.03333333 0.33333333 
  ##      00110      00100      00010
  ## 0.03333333 0.23333333 0.06666667
  
  names(out2)
  ## [1] "AlxT"  "MalD"  "MslCh" "pop"



