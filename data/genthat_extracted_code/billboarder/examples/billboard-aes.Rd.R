library(billboarder)


### Name: billboard-aes
### Title: Map variables on the chart
### Aliases: billboard-aes bb_aes bb_aes_string bbaes bbaes_string

### ** Examples

## Not run: 
##D dat <- as.data.frame(table(sample(letters[1:5], 100, TRUE)))
##D 
##D billboarder(data = dat) %>% 
##D   bb_aes(x = Var1, y = Freq) %>% 
##D   bb_barchart()
##D 
##D 
##D tab <- table(sample(letters[1:5], 100, TRUE), sample(LETTERS[1:5], 100, TRUE))
##D dat_group <- as.data.frame(tab)
##D 
##D billboarder(data = dat_group) %>% 
##D   bb_aes(x = Var1, y = Freq, group = "Var2") %>% 
##D   bb_barchart()
## End(Not run)



