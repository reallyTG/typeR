library(SWMPrExtension)


### Name: res_national_map
### Title: Reserve National Map
### Aliases: res_national_map

### ** Examples

##National map highlighting states with NERRS
nerr_states <- c('01', '02', '06', '10', '12', '13', '15'
, '23', '24', '25', '27', '28', '33', '34', '36', '37', '39'
, '41', '44', '45', '48', '51', '53', '55', '72')

res_national_map(highlight_states = nerr_states)

## Not run: 
##D #' ##Just the national map
##D res_national_map()
##D 
##D ##National map highlighting west coast states and NERRS (including AK)
##D nerr_states_west <- c('02', '06', '41', '53')
##D 
##D nerrs_codes <- c('pdb', 'sos', 'sfb', 'elk', 'tjr', 'kac')
##D 
##D res_national_map(highlight_states = nerr_states_west, highlight_reserve = nerrs_codes)
## End(Not run)



