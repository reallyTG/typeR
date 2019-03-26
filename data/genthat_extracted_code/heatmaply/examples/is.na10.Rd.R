library(heatmaply)


### Name: is.na10
### Title: Indicates which elements are missing (either 1 and 0)
### Aliases: is.na10

### ** Examples

## Not run: 
##D x <- mtcars
##D x <- data.frame(x)
##D x$am <- factor(x$am)
##D x$vs <- factor(x$vs)
##D set.seed(2017-01-19)
##D x[sample(nrow(x))[1:6],sample(ncol(x))[1:6]] <- NA
##D 
##D 
##D # nice grey colors from here: https://github.com/njtierney/visdat/blob/master/R/vis_miss_ly.R
##D x %>% is.na10 %>% heatmaply( colors = c("grey80", "grey20"), dendrogram = "none")
##D x %>% is.na10 %>% heatmaply( colors = c("grey80", "grey20"), k_col = 2, k_row = 2)
##D 
##D heatmaply(is.na10(airquality), grid_gap = 1,
##D          colors = c("grey80", "grey20"), k_col = 2, k_row = 2)
##D 
## End(Not run)



