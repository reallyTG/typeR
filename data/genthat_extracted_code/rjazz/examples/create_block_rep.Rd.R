library(rjazz)


### Name: create_block_rep
### Title: Create a data block in the server by repeating a value a number
###   of times
### Aliases: create_block_rep

### ** Examples

## Not run: 
##D create_source('demo_put')
##D 
##D create_block_rep('demo_put', 'bool_1', TRUE, 3)
##D any(rep(TRUE, 3) != get_R_block('demo_put', 'bool_1'))
##D 
##D create_block_rep('demo_put', 'int_1', 2L, 4)
##D any(rep(2L, 4) != get_R_block('demo_put', 'int_1'))
##D 
##D create_block_rep('demo_put', 'real_1', 3.14, 5)
##D any(rep(3.14, 5) != get_R_block('demo_put', 'real_1'))
##D 
##D create_block_rep('demo_put', 'str_1', 'Hi!', 6)
##D any(rep('Hi!', 6) != get_R_block('demo_put', 'str_1'))
##D 
##D create_block_seq('demo_put', 'int_2', 456L, 999L, 123L)
##D any(seq(456L, 999L, 123L) != get_R_block('demo_put', 'int_2'))
##D 
##D create_block_seq('demo_put', 'real_2', 0.123, 4.56, 0.789)
##D any(seq(0.123, 4.56, 0.789) != get_R_block('demo_put', 'real_2'))
##D 
##D delete_source('demo_put')
## End(Not run)



