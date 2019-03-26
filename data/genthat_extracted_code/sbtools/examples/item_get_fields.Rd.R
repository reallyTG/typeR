library(sbtools)


### Name: item_get_fields
### Title: Retrieve specific fields from an SB item
### Aliases: item_get_fields

### ** Examples

# Get certain fields from an item
item_get_fields("4f4e4b24e4b07f02db6aea14", c('title', 'citation', 'contacts'))

## Not run: 
##D # If only 1 field selection, do or don't drop list format
##D item_get_fields("4f4e4b24e4b07f02db6aea14", 'title')
##D item_get_fields("4f4e4b24e4b07f02db6aea14", 'title', drop = FALSE)
## End(Not run)



