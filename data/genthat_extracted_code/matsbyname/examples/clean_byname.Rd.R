library(matsbyname)


### Name: clean_byname
### Title: Cleans (deletes) rows or columns of matrices that contain
###   exclusively 'clean_value'
### Aliases: clean_byname

### ** Examples

m <- matrix(c(-20, 1, -20, 2), nrow = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
m
m %>% clean_byname(margin = 1, clean_value = -20) # Eliminates -20, -20 row
# Nothing cleaned, because no columns contain all 0's (the default clean_value).
m %>% clean_byname(margin = 2) 
# Also works with lists
list(m, m) %>% clean_byname(margin = 1, clean_value = -20)
# Also works with data frames
DF <- data.frame(m = I(list()))
DF[[1,"m"]] <- m
DF[[2,"m"]] <- m
DF %>% clean_byname(margin = 1, clean_value = -20)
m2 <- matrix(c(-20, -20, 0, -20, -20, 0, -20, -20, -20), nrow = 3,
             dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3")) )
m2
clean_byname(m2, margin = c(1,2), clean_value = -20)
DF2 <- data.frame(m2 = I(list()))
DF2[[1, "m2"]] <- m2
DF2[[2, "m2"]] <- m2
DF2 %>% clean_byname(margin = c(1, 2), clean_value = -20)



