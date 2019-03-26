library(Momocs)


### Name: Coo
### Title: Coo "super" class
### Aliases: Coo

### ** Examples

## Not run: 
##D # to see all methods for Coo objects.
##D methods(class='Coo')
##D 
##D # to see all methods for Out objects.
##D methods(class='Out') # same for Opn and Ldk
##D 
##D # Let's take an Out example. But all methods shown here
##D # work on Ldk (try on 'wings') and on Opn ('olea')
##D bot
##D 
##D # Primarily a 'Coo' object, but also an 'Out'
##D class(bot)
##D inherits(bot, "Coo")
##D panel(bot)
##D stack(bot)
##D plot(bot)
##D 
##D # Getters (you can also use it to set data)
##D bot[1] %>% coo_plot()
##D bot[1:5] %>% str()
##D 
##D # Setters
##D bot[1] <- shapes[4]
##D panel(bot)
##D 
##D bot[1:5] <- shapes[4:8]
##D panel(bot)
##D 
##D # access the different components
##D # $coo coordinates
##D head(bot$coo)
##D # $fac grouping factors
##D head(bot$fac)
##D # or if you know the name of the column of interest
##D bot$type
##D # table
##D table(bot$fac)
##D # an internal view of an Out object
##D str(bot)
##D 
##D # subsetting
##D # see ?filter, ?select, and their 'see also' section for the
##D # complete list of dplyr-like verbs implemented in Momocs
##D 
##D length(bot) # the number of shapes
##D names(bot) # access all individual names
##D bot2 <- bot
##D names(bot2) <- paste0('newnames', 1:length(bot2)) # define new names
## End(Not run)



