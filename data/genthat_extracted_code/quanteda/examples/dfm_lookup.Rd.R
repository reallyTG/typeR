library(quanteda)


### Name: dfm_lookup
### Title: Apply a dictionary to a dfm
### Aliases: dfm_lookup
### Keywords: dfm

### ** Examples

my_dict <- dictionary(list(christmas = c("Christmas", "Santa", "holiday"),
                          opposition = c("Opposition", "reject", "notincorpus"),
                          taxglob = "tax*",
                          taxregex = "tax.+$",
                          country = c("United_States", "Sweden")))
my_dfm <- dfm(c("My Christmas was ruined by your opposition tax plan.", 
               "Does the United_States or Sweden have more progressive taxation?"),
             remove = stopwords("english"), verbose = FALSE)
my_dfm

# glob format
dfm_lookup(my_dfm, my_dict, valuetype = "glob")
dfm_lookup(my_dfm, my_dict, valuetype = "glob", case_insensitive = FALSE)

# regex v. glob format: note that "united_states" is a regex match for "tax*"
dfm_lookup(my_dfm, my_dict, valuetype = "glob")
dfm_lookup(my_dfm, my_dict, valuetype = "regex", case_insensitive = TRUE)

# fixed format: no pattern matching
dfm_lookup(my_dfm, my_dict, valuetype = "fixed")
dfm_lookup(my_dfm, my_dict, valuetype = "fixed", case_insensitive = FALSE)

# show unmatched tokens
dfm_lookup(my_dfm, my_dict, nomatch = "_UNMATCHED")




