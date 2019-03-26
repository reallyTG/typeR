library(SWMPrExtension)


### Name: national_sk_map
### Title: Reserve National Map with Seasonal Kendall Results
### Aliases: national_sk_map

### ** Examples

##National map highlighting west coast states and NERRS (including AK)
nerr_states_west <- c('02', '06', '41', '53')

nerrs_codes <- c('pdb', 'sos', 'sfb', 'elk', 'tjr', 'kac')
nerrs_sk_results <- c('inc', 'inc', 'dec', 'insig', 'insuff', 'dec')

national_sk_map(sk_reserve = nerrs_codes, sk_results = nerrs_sk_results)




