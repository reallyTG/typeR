library(epitrix)


### Name: hash_names
### Title: Anonymise data using scrypt
### Aliases: hash_names

### ** Examples


first_name <- c("Jane", "Joe", "Raoul")
last_name <- c("Doe", "Smith", "Dupont")
age <- c(25, 69, 36)

hash_names(first_name, last_name, age)

hash_names(first_name, last_name, age,
           size = 8, full = FALSE)


## salting the hashing (more secure!)
hash_names(first_name, last_name) # unsalted - less secure
hash_names(first_name, last_name, salt = 123) # salted with an integer
hash_names(first_name, last_name, salt = "foobar") # salted with an character



