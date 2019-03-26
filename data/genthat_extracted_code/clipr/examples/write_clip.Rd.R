library(clipr)


### Name: write_clip
### Title: Write clipboard
### Aliases: write_clip

### ** Examples

## Not run: 
##D text <- "Write to clipboard"
##D write_clip(text)
##D 
##D multiline <- c("Write", "to", "clipboard")
##D write_clip(multiline)
##D # Write
##D # to
##D # clipboard
##D 
##D write_clip(multiline, breaks = ",")
##D # write,to,clipboard
##D 
##D tbl <- data.frame(a=c(1,2,3), b=c(4,5,6))
##D write_clip(tbl)
## End(Not run)




