library(cwhmisc)


### Name: int2
### Title: convert integers, string to integer vector
### Aliases: NdM int2ASCII int2B int2Oct int2Hex strRound
### Keywords: arith

### ** Examples

  NdM(10^(1:4)) # 5
  int2ASCII(1:255)[121:129] # "x" "y" "z" "{" "|" "}" "~" "\177" "\200"
  int2B(1:50,2) # all of same length
  int2B(1:50*(-1)^(1:50),just="r") # left flush
  unlist(sapply(1:50,int2B,2,just="l")[1,] ) # individual lengths
  unlist(sapply(1:50,int2B,7)[1,] ) # individual lengths
  unlist(sapply(1:50,int2B)[1,] )
  unlist(sapply(1:50,int2Oct)[1,] )
  unlist(sapply(1:50,int2Hex)[1,] )
  strRound(pi*10^4,0)/10^4 == strRound(pi,4) # TRUE



