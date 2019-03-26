library(qdapRegex)


### Name: rm_city_state
### Title: Remove/Replace/Extract City & State
### Aliases: rm_city_state ex_city_state
### Keywords: date

### ** Examples

x <- paste0("I went to Washington Heights, NY for food! ", 
   "It's in West ven,PA, near Bolly Bolly Bolly, CA!", 
   "I like Movies, PG13")
rm_city_state(x)
ex_city_state(x)



