library(pyramid)


### Name: pyramids
### Title: Drawing population pyramid using vectors
### Aliases: pyramids
### Keywords: hplot

### ** Examples

 py.Males <- c(80,40,30,20,10)
 names(py.Males) <- c('0-9','10-19','20-29','30-39','40-')
 py.Females <- c(60,50,40,30,5)
 pyramids(Left=py.Males,Llab="Males",Right=py.Females,Rlab="Females",
  Laxis=c(0,50,100),main="An example of population pyramid\n with fixed axis")



