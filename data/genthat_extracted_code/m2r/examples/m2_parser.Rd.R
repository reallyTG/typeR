library(m2r)


### Name: m2_parser
### Title: Convert a M2 object into an R object
### Aliases: m2_parser m2_parse print.m2_integer print.m2_float
###   print.m2_complex print.m2_string print.m2_boolean print.m2_list
###   print.m2_array print.m2_sequence print.m2_symbol print.m2_option
###   print.m2_hashtable print.m2_module m2_toggle_gmp get_m2_gmp

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D m2("1+1")
##D m2.("1+1")
##D m2_parse(m2.("1+1"))
##D 
##D m2("QQ[x,y]")
##D m2.("QQ[x,y]")
##D m2_parse(m2.("QQ[x,y]"))
##D 
##D get_m2_gmp()
##D m2("3/2") %>% m2_parse()
##D m2_toggle_gmp() # gmp on
##D m2("3/2") %>% m2_parse()
##D m2("6/4") %>% m2_parse()
##D m2("3345234524352435432/223454325235432524352433245") %>% m2_parse()
##D m2_toggle_gmp() # gmp off
##D 
##D 
##D 
##D m2("50!") %>% m2_parse()
##D m2_toggle_gmp() # gmp on
##D m2("50!") %>% m2_parse()
##D m2_toggle_gmp() # gmp off
##D 
## End(Not run)



