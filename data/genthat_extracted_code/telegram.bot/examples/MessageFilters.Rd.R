library(telegram.bot)


### Name: MessageFilters
### Title: Filter message updates
### Aliases: MessageFilters
### Keywords: datasets

### ** Examples

## Not run: 
##D # Use to filter all video messages
##D video_handler <- MessageHandler(callback_method, MessageFilters$video)
##D 
##D # To filter all contacts, etc.
##D contact_handler <- MessageHandler(callback_method, MessageFilters$contact)
## End(Not run)



