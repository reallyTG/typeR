library(inegiR)


### Name: ordenar_porconteo
### Title: Order factors by count
### Aliases: ordenar_porconteo

### ** Examples

df <- data.frame(factors=c("A","A","B","C","C","D","A","A"),
                 others=c(1,3,2,4,5,1,2,7))
#order by count
ByCount <- ordenar_porconteo(df, factors)




