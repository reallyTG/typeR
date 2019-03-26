library(staRdom)


### Name: list_join
### Title: Full join of a list of data frames.
### Aliases: list_join

### ** Examples

a <- data.frame(what=letters[1:5],a=c(1:5))
b <- data.frame(what=letters[1:5],b=c(7:11))
c <- data.frame(what=letters[1:5],c=c(20:24))

df_list <- list(a,b,c)

list_join(df_list,by="what")



