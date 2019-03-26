library(qdapRegex)


### Name: rm_city_state_zip
### Title: Remove/Replace/Extract City, State, & Zip
### Aliases: rm_city_state_zip ex_city_state_zip
### Keywords: date

### ** Examples

x <- paste0("I went to Washington Heights, NY 54321 for food! ", 
   "It's in West ven,PA 12345, near Bolly Bolly Bolly, CA12345-1234!", 
   "hello world")
rm_city_state_zip(x)
ex_city_state_zip(x)



