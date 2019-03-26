library(plotrix)


### Name: print.brklist
### Title: Display the output of brkdnNest
### Aliases: print.brklist
### Keywords: misc

### ** Examples

 printbrktest<-data.frame(A=c(sample(1:10,99,TRUE),NA),
  B=sample(c("Yes","No"),100,TRUE),
  C=sample(LETTERS[1:3],100,TRUE))
 pbt<-brkdnNest(A~B+C,printbrktest)
 print(pbt)



