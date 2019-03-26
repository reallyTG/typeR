library(rjazz)


### Name: delete_block
### Title: Delete a block on the server
### Aliases: delete_block

### ** Examples

## Not run: 
##D create_source('demo_bin')
##D 
##D # When a string is written into a raw block, charToRaw() is applied automatically.
##D put_raw_block('demo_bin', 'blk_1', 'Hello world!')
##D 
##D a <- get_raw_block('demo_bin', 'blk_1')
##D # a is raw
##D rawToChar(a)
##D 
##D # This is the same.
##D put_raw_block('demo_bin', 'blk_2', charToRaw('Hello again!'))
##D rawToChar(get_raw_block('demo_bin', 'blk_2'))
##D 
##D # Anything else can be written by serializing as raw.
##D put_raw_block('demo_bin', 'blk_3', serialize(iris, NULL))
##D 
##D head(unserialize(get_raw_block('demo_bin', 'blk_3')))
##D 
##D # Delete the block or fail
##D delete_block('demo_bin', 'blk_1')
##D 
##D # Delete will fail, but make it silent
##D delete_block('demo_bin', 'blk_1', silent = TRUE)
##D 
##D # No need to delete all blocks, they will be deleted by deleting the source.
##D delete_source('demo_bin')
## End(Not run)



