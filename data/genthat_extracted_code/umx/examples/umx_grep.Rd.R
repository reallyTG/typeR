library(umx)


### Name: umx_grep
### Title: umx_grep
### Aliases: umx_grep

### ** Examples

umx_grep(mtcars, "hp", output="both", ignore.case= TRUE)
umx_grep(c("hp", "ph"), "hp")
umx_grep(mtcars, "^h.*", output="both", ignore.case= TRUE)
## Not run: 
##D umx_grep(spss_df, "labeltext", output = "label") 
##D umx_grep(spss_df, "labeltext", output = "name") 
## End(Not run)



