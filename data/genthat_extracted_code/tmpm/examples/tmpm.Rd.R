library(tmpm)


### Name: tmpm
### Title: Trauma Mortality Prediction Model
### Aliases: tmpm
### Keywords: ~tmpm ~mortality

### ** Examples

## To evaluate ICD-9 patient data in wide format

    #inc_key  dx1    dx2 dx3    dx4
  #1 10000007 821.11 822 815.03 823.00
  #2 10011410 881.00 891 822.10 813.42

a <- data.frame(matrix(c(10000007,821.11,822,815.03,823,
          10011410,881,891,822.1,813.42),nrow = 2,byrow = TRUE))
names(a) <- c("inc_key","dx1","dx2","dx3","dx4")
b <- tmpm(a,9)

## If the dataset is in long format

    #inc_key  variable value
  #1 10000007      dx1 821.11
  #2 10011410      dx1 881.00
  #3 10000007      dx2 822.00
  #4 10011410      dx2 891.00
  #5 10000007      dx3 815.03
  #6 10011410      dx3 822.10
  #7 10000007      dx4 823.00
  #8 10011410      dx4 813.42

c <- melt(a,id = "inc_key")
d <- tmpm(c,9,Long = TRUE)



