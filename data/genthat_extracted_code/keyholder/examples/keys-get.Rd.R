library(keyholder)


### Name: keys-get
### Title: Get keys
### Aliases: keys-get keys raw_keys has_keys

### ** Examples

keys(mtcars)

raw_keys(mtcars)

has_keys(mtcars)

df <- key_by(mtcars, vs, am)
keys(df)

has_keys(df)




