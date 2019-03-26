library(LCMCR)


### Name: lcm_CR_Basic_generator
### Title: Generator for Class 'lcm_CR_Basic'
### Aliases: lcm_CR_Basic_generator

### ** Examples

data(kosovo_aggregate)
x <- lcm_CR_Basic_generator(data_captures=kosovo_aggregate, K=10, a_alpha=0.25, b_alpha=0.25, 
                                len_buffer=10000, subsamp=500, in_list_symbol = '1')
x$Get_Status()



