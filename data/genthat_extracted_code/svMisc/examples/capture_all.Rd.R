library(svMisc)


### Name: capture_all
### Title: Run an R expression and capture output and messages in a similar
###   way as it would be done at the command line
### Aliases: capture_all captureAll
### Keywords: IO

### ** Examples

writeLines(capture_all(expression(1 + 1), split = FALSE))
writeLines(capture_all(expression(1 + 1), split = TRUE))
writeLines(capture_all(parse_text("search()"), split = FALSE))
## Not run: 
##D writeLines(capture_all(parse_text('1:2 + 1:3'), split = FALSE))
##D writeLines(capture_all(parse_text("badname"), split = FALSE))
## End(Not run)

# Management of incomplete lines
capt_res <- capture_all(parse_text("1 +")) # Clearly an incomplete command
if (is.na(capt_res)) cat("Incomplete line!\n") else writeLines(capt_res)
rm(capt_res)



