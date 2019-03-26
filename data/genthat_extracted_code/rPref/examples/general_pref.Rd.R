library(rPref)


### Name: general_pref
### Title: Utility Functions for Preferences
### Aliases: as.expression,basepref-method as.expression,complexpref-method
###   as.expression,emptypref-method as.expression,preference-method
###   as.expression,reversepref-method assoc.df assoc.df,preference-method
###   assoc.df<- assoc.df<-,preference-method empty general_pref
###   is.empty_pref is.preference length,basepref-method
###   length,complexpref-method length,emptypref-method
###   length,preference-method length,reversepref-method

### ** Examples


# Same as low(a) * low(b)
p <- low(a) * low(b) * empty()

# returns 2, as empty() does not count
length(p)

# the preference expression (without empty())
as.expression(p)




