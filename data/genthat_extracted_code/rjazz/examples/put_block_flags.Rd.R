library(rjazz)


### Name: put_block_flags
### Title: Write flags into a block's header
### Aliases: put_block_flags

### ** Examples

## Not run: 
##D create_source('demo_types')
##D 
##D # Write a text file as a block.
##D txt <- c('Hi all,', '', 'This is a file.', '', 'bye,', 'me')
##D str <- paste(txt, collapse = '\n')
##D cat(str)
##D 
##D put_raw_block('demo_types', 'blk_1', str)
##D 
##D # The block is raw (not interpreted as data by the server) and can be converted to any raw type.
##D set_compatible_data_type('demo_types', 'blk_1', type_const[['BLOCKTYPE_RAW_MIME_TXT']])
##D 
##D # curl 127.0.0.1:8888//demo_types.blk_1 (or open in a in a browser)
##D 
##D get_block_attributes('demo_types', 'blk_1')
##D 
##D # The attribute flags is writable by the user.
##D put_block_flags('demo_types', 'blk_1', 123000444)
##D 
##D get_block_attributes('demo_types', 'blk_1')
##D 
##D # Unlike the previous block, this block is a data block.
##D put_R_block('demo_types', 'blk_2', 3:6)
##D 
##D # This trivial block can also be created by the server as..
##D create_block_seq('demo_types', 'blk_2', 3L, 6)
##D 
##D get_block_attributes('demo_types', 'blk_2')
##D 
##D # The block is interpreted as data by the server, it is an integer and can be converted to
##D any integer type.
##D set_compatible_data_type('demo_types', 'blk_2', type_const[['BLOCKTYPE_C_R_GRADE']])
##D 
##D get_block_attributes('demo_types', 'blk_2')
##D 
##D # This returns all the rows in a single string
##D get_block_as_string('demo_types', 'blk_2', '##D 
##D 
##D # With some help of R functions, the result of get_block_as_string() can be made integer again.
##D any(3:6 != as.integer(strsplit(get_block_as_string('demo_types', 'blk_2', '##D 
##D 
##D rs <- c('1', '2.7', '3.14')
##D 
##D # Creating strings into numeric data. (The parse(.., collapse = '\n') is automatic.)
##D put_strings_as_block('demo_types', 'blk_3', rs, type_const[['BLOCKTYPE_C_R_REAL']])
##D 
##D get_block_attributes('demo_types', 'blk_3')
##D 
##D any(as.numeric(rs) != get_R_block('demo_types', 'blk_3'))
##D 
##D delete_source('demo_types')
## End(Not run)



