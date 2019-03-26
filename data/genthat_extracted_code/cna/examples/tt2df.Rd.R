library(cna)


### Name: tt2df
### Title: Transform a truth table into a data frame
### Aliases: tt2df

### ** Examples

tt.educate <- truthTab(d.educate[1:2])
tt.educate
tt2df(tt.educate)

dat1 <- some(truthTab(allCombs(c(2, 2, 2, 2, 2)) - 1), n = 200, replace = TRUE)
dat2 <- selectCases("(A*b + a*B <-> C)*(C*d + c*D <-> E)", dat1)
dat2 
tt2df(dat2)

dat3 <- data.frame(
  A = c(1,1,1,1,1,1,0,0,0,0,0),
  B = c(1,1,1,0,0,0,1,1,1,0,0),
  C = c(1,1,1,1,1,1,1,1,1,0,0),
  D = c(1,0,0,1,0,0,1,1,0,1,0),
  E = c(1,1,0,1,1,0,1,0,1,1,0)
  )
tt.dat3 <- truthTab(dat3, frequency = c(4,3,5,7,4,6,10,2,4,3,12))
tt2df(tt.dat3)



