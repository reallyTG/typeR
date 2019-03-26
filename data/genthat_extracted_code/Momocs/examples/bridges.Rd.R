library(Momocs)


### Name: bridges
### Title: Convert between different classes
### Aliases: bridges l2m m2l d2m m2d l2a a2l a2m m2a m2ll

### ** Examples

# matrix/list
wings[1] %>% coo_sample(4) %>%
   m2l() %T>% print %>%        # matrix to list
   l2m()                       # and back

# data.frame/matrix
wings[1] %>% coo_sample(4) %>%
   m2d() %T>% print %>%        # matrix to data.frame
   d2m                         # and back

 # list/array
 wings %>% slice(1:2) %$%
 coo %>% l2a %T>% print %>%    # list to array
 a2l                           # and back

 # array/matrix
 wings %>% slice(1:2) %$%
 l2a(coo) %>%                  # and array (from a list)
 a2m %T>% print %>%            # to matrix
 m2a                           # and back

 # m2ll
m2ll(wings[1], c(6, 4, 3, 5)) # grab slices and coordinates



