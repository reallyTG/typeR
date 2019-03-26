library(naniar)


### Name: unbinders
### Title: Unbind (remove) shadow from data, and vice versa
### Aliases: unbinders unbind_shadow unbind_data

### ** Examples


# bind shadow columns
aq_sh <- bind_shadow(airquality)

# print data
aq_sh

# remove shadow columns
unbind_shadow(aq_sh)

# remove data
unbind_data(aq_sh)

# errors when you don't use data with shadows
## Not run: 
##D  unbind_data(airquality)
##D  unbind_shadow(airquality)
## End(Not run)




