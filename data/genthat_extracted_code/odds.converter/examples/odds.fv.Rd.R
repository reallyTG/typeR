library(odds.converter)


### Name: odds.fv
### Title: Calculate the fair (vigorish free) odds for a vector of vigged
###   odds.
### Aliases: odds.fv

### ** Examples

odds.fv(-120,110)
odds.fv(2.05,3.12,2.90,input="dec",output="prob")
df <- data.frame(Home = c(1.5,1.8,1.9),
                Away = c(2.9,2.2,2.05))
odds.fv(df,input = "dec",output = "prob")
odds.fv(df$Home,df$Away,input="dec",output="prob")
odds.fv(df$Home,df$Away,input="dec",output="prob",Vectorized2wayOutput1stElement = TRUE)



