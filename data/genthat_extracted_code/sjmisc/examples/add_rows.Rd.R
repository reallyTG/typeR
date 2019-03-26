library(sjmisc)


### Name: add_rows
### Title: Merge labelled data frames
### Aliases: add_rows merge_df

### ** Examples

library(dplyr)
data(efc)
x1 <- efc %>% select(1:5) %>% slice(1:10)
x2 <- efc %>% select(3:7) %>% slice(11:20)

mydf <- add_rows(x1, x2)
mydf
str(mydf)

## Not run: 
##D library(sjPlot)
##D view_df(mydf)
## End(Not run)

x3 <- efc %>% select(5:9) %>% slice(21:30)
x4 <- efc %>% select(11:14) %>% slice(31:40)

mydf <- add_rows(x1, x2, x3, x4, id = "subsets")
mydf
str(mydf)




